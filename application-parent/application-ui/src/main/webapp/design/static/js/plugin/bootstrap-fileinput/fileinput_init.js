$(function () {
    projectfileoptions = {
        language: 'zh', //设置语言  
        // uploadUrl: 'upload', //上传地址  
        showUpload: false, //是否显示上传按钮  
        showRemove: false, //显示移除按钮
        showPreview: true, //是否显示预览
        dropZoneEnabled: false, //是否显示拖拽区域
        showCaption: true, //是否显示标题  
        autoReplace: true, //是否自动替换当前图片
        allowedPreviewTypes: ['image'],
        allowedFileTypes: ['image'],
        allowedFileExtensions: ['jpg', 'gif', 'png'], //接收的文件后缀
        maxFileSize: 2000, //单位为kb，如果为0表示不限制文件大小
        maxFileCount: 1, //表示允许同时上传的最大文件个数
        browseClass: "btn btn-primary btn-sm", //按钮样式  
        msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
    }

    $(".jiuang_file_img").each(function () {
        var $this = $(this);
        var op = projectfileoptions;
        var nowImgUrl = $this.attr("value");
        if (nowImgUrl) {
            op = $.extend({
                initialPreview: [ // 预览图片的设置
                    "<img src='" + nowImgUrl + "' class='file-preview-image' style='width:auto;height:120px;'>",
                ]
            }, op);
        }
        var url = $this.attr("action") || '';
        if (!url) {
            url = "upload"
        }
        op = $.extend({
            uploadUrl: url
        }, op);
        $this.fileinput(op).on("filebatchselected", function (event, files) {
            $(this).fileinput("upload");
        }).on("fileuploaded", function (event, data) {
            var response = data.response;           
            if (response) {
                if (response.result = 'success') {
                    $this.attr('value', response.fileUrl);
                    // 解决表单序列化时无法取得type='file'类型value值问题
                    $('#tofba_file_hidden_value').val(response.fileUrl);
                } else {
                    var fileName = response.fileName;
                    qiao.bs.alert(fileName + "上传失败");
                    $this.fileinput("clear");
                    $this.fileinput("reset");
                    $this.fileinput('refresh');
                    $this.fileinput('enable');
                }
            } else {
                qiao.bs.alert("没有找到文件");
                $this.fileinput("clear");
                $this.fileinput("reset");
                $this.fileinput('refresh');
                $this.fileinput('enable');
            }
        });
    })
})