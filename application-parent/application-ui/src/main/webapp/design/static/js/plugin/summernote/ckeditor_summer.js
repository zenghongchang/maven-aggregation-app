$(function () {
    $('.summernote').each(function () {
        var $this = $(this);
        var placeholder = $this.attr("placeholder") || '';
        var url = $this.attr("action") || '';
        if (!url) {
            url = "/ckeditorUploader"
        }
        $this.summernote({
            lang: 'zh-CN',
            placeholder: placeholder,
            minHeight: 300,
            dialogsInBody: true,  //对话框放在编辑框还是Body            
            dialogsFade: true ,//对话框显示效果             
            toolbar: [
                ['fontname', ['fontname']], //字体系列                                 
                ['style', ['bold', 'italic', 'underline', 'clear']], // 字体粗体、字体斜体、字体下划线、字体格式清除       'bold', 'italic', 'underline', 'clear' 
                ['font', ['strikethrough', 'superscript', 'subscript']], //字体划线、字体上标、字体下标   
                ['fontsize', ['fontsize']], //字体大小                                
                ['color', ['color']], //字体颜色              
                // 段落工具
                ['style', ['style']], //样式
                ['para', ['ul', 'ol', 'paragraph']], //无序列表、有序列表、段落对齐方式
                ['height', ['height']], //行高   
                // 插入表格
                ['table', ['table']], //插入表格    
                ['hr', ['hr']], //插入水平线                
                ['link', ['link']], //插入链接                
                ['picture', ['picture']], //插入图片                
                // ['video', ['video']], //插入视频
                // 其他
                ['fullscreen', ['fullscreen']], //全屏
                ['codeview', ['codeview']], //查看html代码
                ['undo', ['undo']], //撤销
                ['redo', ['redo']], //取消撤销
            ],
            callbacks: {
                onImageUpload: function (files) {
                    var $files = $(files);
                    $files.each(function () {
                        var file = this;
                        var data = new FormData();
                        data.append("file", file);
                        data.append("centerFolderPath", "ckeditor");
                        $.ajax({
                            data: data,
                            type: "POST",
                            url: url,
                            cache: false,
                            contentType: false,
                            processData: false,
                            success: function (response) {
                                    if (response.result == 'success') {
                                        var fileUrl = response.fileUrl;
                                        $this.summernote('insertImage', fileUrl, function ($image) {});
                                    } else {
                                        var fileName = response.fileName;
                                        qiao.bs.alert(fileName + "上传失败");
                                    }
                                },
                                error: function () {
                                    qiao.bs.alert("服务器异常，请重试");
                                }
                        });
                    });
                }
            }
        });
    });
});