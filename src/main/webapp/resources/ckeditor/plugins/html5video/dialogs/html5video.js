CKEDITOR.dialog.add( 'html5video', function( editor ) {
    return {
        title: editor.lang.html5video.title,
        minWidth: 500,
        minHeight: 100,
        contents: [ {
            id: 'info',
            label: editor.lang.html5video.infoLabel,
            elements: [ 
            {
                type: 'vbox',
                padding: 0,
                children: [
                    {
                    type: 'hbox',
                    widths: [ '365px', '110px' ],
                    align: 'right',
                    children: [ {
                        type: 'text',
                        id: 'url',
                        label: editor.lang.html5video.allowed,
                        required: true,
                        validate: CKEDITOR.dialog.validate.notEmpty( editor.lang.html5video.urlMissing ),
                        setup: function( widget ) {
                            this.setValue( widget.data.src );
                        },
                        commit: function( widget ) {
                            widget.setData( 'src', this.getValue() );
                        }
                    },
                    {
                        type: 'button',
                        id: 'browse',
                        // v-align with the 'txtUrl' field.
                        // TODO: We need something better than a fixed size here.
                        style: 'display:inline-block;margin-top:14px;',
                        align: 'center',
                        label: editor.lang.common.browseServer,
                        hidden: true,
                        filebrowser: 'info:url'
                    } ]
                } ]
            },
            {
                type: 'checkbox',
                id: 'responsive',
                label: "원본 영상 파일",
                setup: function( widget ) {
                    this.setValue( widget.data.responsive );
                },
                commit: function( widget ) {
                    widget.setData( 'responsive', this.getValue()?'true':'' );
                }
            }]
        },
        {
            id: 'Upload',
            hidden: true,
            filebrowser: 'uploadButton',
            label: editor.lang.html5video.upload,
            elements: [ {
                type: 'file',
                id: 'upload',
                label: editor.lang.html5video.btnUpload,
                style: 'height:40px',
                size: 38
            },
            {
                type: 'fileButton',
                id: 'uploadButton',
                filebrowser: 'info:url',
                label: editor.lang.html5video.btnUpload,
                'for': [ 'Upload', 'upload' ]
            } ]
        }]
    };
} );
