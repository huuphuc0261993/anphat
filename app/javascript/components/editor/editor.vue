<template>
    <div id="app">
        <ckeditor v-model="editorData" :config="editorConfig"></ckeditor>
        
    </div>
</template>

<script>
    export default {
        name: 'app',
        data() {
            return {
                editorData: '',
                editorConfig: {
                    toolbar: [
						[ 'Source' ],
						[ 'Styles', 'Format', 'Font', 'FontSize' ],
						[ 'Bold', 'Italic' ],
            [ 'Undo', 'Redo' ],
            ['Table'],
            ['Image']
					]
                }
            };
        },
    }
</script>