<template>
    <div>
        <p>
            <button v-on:click="add()" class="btn btn-white btn-default btn-round">
                <i class="ace-icon fa fa-edit red2"></i>
                add
            </button>
            &nbsp;
            <button v-on:click="list(1)" class="btn btn-white btn-default btn-round">
                <i class="ace-icon fa fa-refresh red2"></i>
                refresh
            </button>
        </p>

        <pagination ref="pagination" v-bind:list="list"></pagination>

        <table id="simple-table" class="table  table-bordered table-hover">
            <thead>
            <tr>
                <th>ID</th>
                <th>名称</th>
                <th>课程ID</th>
                <th>操作</th>
            </tr>
            </thead>

            <tbody>
            <tr v-for="chapter in chapters" v-bind:key="chapter">
                <td>{{chapter.id}}</td>
                <td>{{chapter.name}}</td>
                <td>{{chapter.courseId}}</td>
                <td>
                    <div class="hidden-sm hidden-xs btn-group">
                        <button class="btn btn-xs btn-info">
                            <i v-on:click="edit(chapter)" class="ace-icon fa fa-pencil bigger-120"></i>
                        </button>
                        <button class="btn btn-xs btn-danger">
                            <i v-on:click="del(chapter.id)" class="ace-icon fa fa-trash-o bigger-120"></i>
                        </button>
                    </div>
                </td>
            </tr>
            </tbody>
        </table>

        <div id="form-modal" class="modal fade" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">表单</h4>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">名称</label>
                                <div class="col-sm-10">
                                    <input v-model="chapter.name" class="form-control" placeholder="名称">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">课程ID</label>
                                <div class="col-sm-10">
                                    <input v-model="chapter.courseId" class="form-control" placeholder="课程ID">
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button type="button" v-on:click="save()" class="btn btn-primary">Save changes</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->

    </div>

</template>

<script>
    import Pagination from "../../components/pagination";
    export default {
        components:{
            Pagination
        },
        name: "chapter",
        data: function(){
            return{
                chapter: {},
                chapters:[]
            }
        },
        mounted: function(){
            let _this = this;
            _this.list(1);
        },
        methods: {
            list(page) {
                let _this = this;
                Loading.show();
                console.log(process.env.VUE_APP_SERVER);
                _this.$ajax.post(process.env.VUE_APP_SERVER +'/business/admin/chapter/list',{
                    page: page,
                    size: _this.$refs.pagination.size
                }).then((response)=>{
                    Loading.hide();
                    let res = response.data;
                    _this.chapters = res.content.list;
                    _this.$refs.pagination.render(page, res.content.total);
                })
            },
            add() {
                let _this = this;
                _this.chapter = {};
                $("#form-modal").modal("show");
            },
            edit(chapter) {
                let _this = this;
                _this.chapter = $.extend({},chapter);
                $("#form-modal").modal("show");
            },
            save(page) {
                let _this = this;

                // 保存校验
                if (!Validator.require(_this.chapter.name, "名称")
                    || !Validator.require(_this.chapter.courseId,"课程ID")
                    || !Validator.length(_this.chapter.courseId, "课程ID", 1, 8)) {
                    return;
                }

                Loading.show();
                _this.$ajax.post(process.env.VUE_APP_SERVER + '/business/admin/chapter/save',_this.chapter).then((response)=>{
                    console.log("保存大章结果",response);
                    let res = response.data;
                    Loading.hide();
                    if(res.success){
                        $("#form-modal").modal("hide");
                        _this.list(1);
                        Toast.success("保存成功");
                    }else {
                        Toast.warning(res.message);
                    }
                })
            },
            del(id) {
                let _this = this;
                Confirm.show("删除后不能还原，是否确认删除？",function() {
                    Loading.show();
                    _this.$ajax.delete(process.env.VUE_APP_SERVER + '/business/admin/chapter/delete/'+id).then((response)=>{
                                    console.log("删除大章结果",response);
                                    let res = response.data;
                                    Loading.hide();
                                    if(res.success){
                                        Toast.success("删除成功");
                                        _this.list(1);
                                    }
                                })
                });
            }
        }
    }
</script>
