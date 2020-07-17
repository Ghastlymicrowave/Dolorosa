{
    "id": "ceeee566-16c8-40c2-b02e-19e2777a8c08",
    "modelName": "GMExtension",
    "mvc": "1.2",
    "name": "nsfs",
    "IncludedResources": [
        "Sprites\\spr_nsfs_demo_white32",
        "Scripts\\demo-scripts\\demo_button",
        "Scripts\\demo-scripts\\demo_trace",
        "Scripts\\demo-scripts\\demo_prompt",
        "Scripts\\demo-scripts\\demo_param",
        "Scripts\\demo-scripts\\demo_sfmt",
        "Scripts\\demo-scripts\\demo_status",
        "Fonts\\fnt_nsfs_demo",
        "Objects\\obj_nsfs_demo",
        "Rooms\\rm_nsfs_demo",
        "Included Files\\nsfs-doc.html"
    ],
    "androidPermissions": [
        
    ],
    "androidProps": true,
    "androidactivityinject": "",
    "androidclassname": "",
    "androidinject": "",
    "androidmanifestinject": "",
    "androidsourcedir": "",
    "author": "",
    "classname": "",
    "copyToTargets": 105554163798254,
    "date": "2020-34-17 01:07:55",
    "description": "",
    "exportToGame": true,
    "extensionName": "",
    "files": [
        {
            "id": "a0218ffc-80a5-4393-ac10-dd51eb045051",
            "modelName": "GMExtensionFile",
            "mvc": "1.0",
            "ProxyFiles": [
                
            ],
            "constants": [
                
            ],
            "copyToTargets": 113497714299118,
            "filename": "nsfs.dll",
            "final": "",
            "functions": [
                {
                    "id": "1c9c0b56-8581-4072-a36a-988e43d7df3a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "nsfs_get_status",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "nsfs_get_status",
                    "returnType": 2
                },
                {
                    "id": "8a59d9fb-32f9-4537-83c6-4ff52920ca1a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "nsfs_get_directory",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "nsfs_get_directory",
                    "returnType": 1
                },
                {
                    "id": "06da0300-13d8-457b-a568-fb6f5b2577d3",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        1
                    ],
                    "externalName": "nsfs_set_directory",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "nsfs_set_directory",
                    "returnType": 2
                },
                {
                    "id": "391edf78-283e-4021-aa40-585ce3931d82",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "nsfs_init_raw",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "nsfs_init_raw",
                    "returnType": 2
                },
                {
                    "id": "eca1d02f-3a04-46d3-afc1-90543f580862",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        1
                    ],
                    "externalName": "file_get_attributes_ns",
                    "help": "file_get_attributes_ns(path) : returned values as per https:\/\/msdn.microsoft.com\/en-us\/library\/windows\/desktop\/gg258117(v=vs.85).aspx",
                    "hidden": false,
                    "kind": 11,
                    "name": "file_get_attributes_ns",
                    "returnType": 2
                },
                {
                    "id": "51baa474-c43f-4eee-b679-499de8386ff6",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        1,
                        2
                    ],
                    "externalName": "file_set_attributes_ns",
                    "help": "file_set_attributes_ns(path, flags) : flags as per https:\/\/msdn.microsoft.com\/en-us\/library\/windows\/desktop\/gg258117(v=vs.85).aspx",
                    "hidden": false,
                    "kind": 11,
                    "name": "file_set_attributes_ns",
                    "returnType": 2
                },
                {
                    "id": "58a1f847-a1fb-4f69-ab11-5b75703f0a8d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        1
                    ],
                    "externalName": "file_get_size_ns",
                    "help": "file_get_size_ns(path) : Returns size of the given file, in bytes.",
                    "hidden": false,
                    "kind": 11,
                    "name": "file_get_size_ns",
                    "returnType": 2
                },
                {
                    "id": "50d9b024-cc49-48ce-b87b-89ae6473c547",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        1
                    ],
                    "externalName": "file_exists_ns",
                    "help": "file_exists_ns(path)",
                    "hidden": false,
                    "kind": 11,
                    "name": "file_exists_ns",
                    "returnType": 2
                },
                {
                    "id": "effe0880-c023-4124-b9ab-82735ca242e2",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        1
                    ],
                    "externalName": "directory_exists_ns",
                    "help": "directory_exists_ns(path)",
                    "hidden": false,
                    "kind": 11,
                    "name": "directory_exists_ns",
                    "returnType": 2
                },
                {
                    "id": "69754fe3-532b-4d85-a74c-8e05dc6ab495",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        1
                    ],
                    "externalName": "file_delete_ns",
                    "help": "file_delete_ns(path)",
                    "hidden": false,
                    "kind": 11,
                    "name": "file_delete_ns",
                    "returnType": 2
                },
                {
                    "id": "cbe5a6d1-df24-447f-bb05-e56da60aef09",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        1
                    ],
                    "externalName": "directory_create_ns",
                    "help": "directory_create_ns(path)",
                    "hidden": false,
                    "kind": 11,
                    "name": "directory_create_ns",
                    "returnType": 2
                },
                {
                    "id": "6c718642-0fa8-44ea-bd6e-75c96797a5c4",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        1
                    ],
                    "externalName": "directory_delete_ns",
                    "help": "directory_delete_ns(path)",
                    "hidden": false,
                    "kind": 11,
                    "name": "directory_delete_ns",
                    "returnType": 2
                },
                {
                    "id": "b57b5e82-15db-43d8-a53d-2b4e985ab3d7",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        1,
                        1
                    ],
                    "externalName": "file_copy_ns",
                    "help": "file_copy_ns(from, to)",
                    "hidden": false,
                    "kind": 11,
                    "name": "file_copy_ns",
                    "returnType": 2
                },
                {
                    "id": "d9934cfc-2fb6-47e5-9265-0463b93dd5aa",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        1,
                        1
                    ],
                    "externalName": "directory_copy_ns",
                    "help": "directory_copy_ns(from, to)",
                    "hidden": false,
                    "kind": 11,
                    "name": "directory_copy_ns",
                    "returnType": 2
                },
                {
                    "id": "3fc7fbf3-033f-446b-bbd4-31c045ac088d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        1,
                        1
                    ],
                    "externalName": "file_rename_ns",
                    "help": "file_rename_ns(from, to)",
                    "hidden": false,
                    "kind": 11,
                    "name": "file_rename_ns",
                    "returnType": 2
                },
                {
                    "id": "fd0c228c-b1b6-4a94-b38c-90d6a4f2ec7b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        1,
                        1
                    ],
                    "externalName": "directory_rename_ns",
                    "help": "directory_rename_ns(from, to)",
                    "hidden": false,
                    "kind": 11,
                    "name": "directory_rename_ns",
                    "returnType": 2
                },
                {
                    "id": "7280b3fd-e273-41a0-b6ce-44097d7a0041",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        1,
                        1
                    ],
                    "externalName": "file_move_ns",
                    "help": "file_move_ns(from, to)",
                    "hidden": false,
                    "kind": 11,
                    "name": "file_move_ns",
                    "returnType": 2
                },
                {
                    "id": "195e1445-0bc8-4994-8926-240a55c603f0",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        1,
                        1
                    ],
                    "externalName": "directory_move_ns",
                    "help": "directory_move_ns(from, to)",
                    "hidden": false,
                    "kind": 11,
                    "name": "directory_move_ns",
                    "returnType": 2
                },
                {
                    "id": "6d68ad3f-0380-409d-8c25-55c2e8a57488",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        1
                    ],
                    "externalName": "file_find_first_ns",
                    "help": "file_find_first_ns(mask)",
                    "hidden": false,
                    "kind": 11,
                    "name": "file_find_first_ns",
                    "returnType": 1
                },
                {
                    "id": "10951b08-3dc9-4dd9-8d5a-e2942c3a4cdb",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "file_find_next_ns",
                    "help": "file_find_next_ns()",
                    "hidden": false,
                    "kind": 11,
                    "name": "file_find_next_ns",
                    "returnType": 1
                },
                {
                    "id": "cc75690c-665a-44d1-bd32-27372b4cd690",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "file_find_close_ns",
                    "help": "file_find_close_ns()",
                    "hidden": false,
                    "kind": 11,
                    "name": "file_find_close_ns",
                    "returnType": 2
                },
                {
                    "id": "f3430c90-5700-4508-a643-78ad4968be65",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "file_find_attributes_ns",
                    "help": "file_find_attributes_ns() : Returns the attributes of the current file in file_find",
                    "hidden": false,
                    "kind": 11,
                    "name": "file_find_attributes_ns",
                    "returnType": 2
                },
                {
                    "id": "c7b5b212-be3f-4ae8-b849-508c05d5be3e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "file_find_size_ns",
                    "help": "file_find_size_ns() : Returns the size (in bytes) of the current file in file_find",
                    "hidden": false,
                    "kind": 11,
                    "name": "file_find_size_ns",
                    "returnType": 2
                },
                {
                    "id": "e4ce5b99-636b-404a-bc74-077ffe9e3b91",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        1,
                        2
                    ],
                    "externalName": "file_text_open_read_ns",
                    "help": "file_text_open_read_ns(path, codepage) : Codepage can be set to -1 for default (UTF-8)",
                    "hidden": false,
                    "kind": 11,
                    "name": "file_text_open_read_ns",
                    "returnType": 2
                },
                {
                    "id": "e317b4af-505e-45d0-9137-d59d164d6f72",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        1,
                        2
                    ],
                    "externalName": "file_text_open_write_ns",
                    "help": "file_text_open_write_ns(path, codepage) : Codepage can be set to -1 for default (UTF-8)",
                    "hidden": false,
                    "kind": 11,
                    "name": "file_text_open_write_ns",
                    "returnType": 2
                },
                {
                    "id": "d97d2b90-b87a-4a20-a6ac-345e1225126f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        1,
                        2
                    ],
                    "externalName": "file_text_open_append_ns",
                    "help": "file_text_open_append_ns(path, codepage) : Codepage can be set to -1 for default (UTF-8)",
                    "hidden": false,
                    "kind": 11,
                    "name": "file_text_open_append_ns",
                    "returnType": 2
                },
                {
                    "id": "446646ca-2c26-4de2-82b8-2a224e3c3c5b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "file_text_close_ns",
                    "help": "file_text_close_ns(fileid)",
                    "hidden": false,
                    "kind": 11,
                    "name": "file_text_close_ns",
                    "returnType": 2
                },
                {
                    "id": "eb5960fe-b1f2-4901-a55f-4ab9d62cdfa1",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "file_text_eof_ns",
                    "help": "file_text_eof_ns(fileid)",
                    "hidden": false,
                    "kind": 11,
                    "name": "file_text_eof_ns",
                    "returnType": 2
                },
                {
                    "id": "7c73e61b-2228-434b-a1e0-150a3f097bac",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "file_text_read_line_ns",
                    "help": "file_text_read_line_ns(fileid) : Reads the next line from a file, skips line separators after it.",
                    "hidden": false,
                    "kind": 11,
                    "name": "file_text_read_line_ns",
                    "returnType": 1
                },
                {
                    "id": "0c0f9512-652e-4d2c-9f64-efaf01bdb7df",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        2,
                        1
                    ],
                    "externalName": "file_text_write_line_ns",
                    "help": "file_text_write_line_ns(fileid, text) : Writes a line and line separators into a file.",
                    "hidden": false,
                    "kind": 11,
                    "name": "file_text_write_line_ns",
                    "returnType": 2
                },
                {
                    "id": "5d2eb078-e87d-4104-935d-3d395430c8d5",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        1
                    ],
                    "externalName": "buffer_load_ns_raw1",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "buffer_load_ns_raw1",
                    "returnType": 2
                },
                {
                    "id": "c3b92500-ee6f-46a7-a4cb-8e64ac742f46",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        1,
                        2
                    ],
                    "externalName": "buffer_load_ns_raw2",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "buffer_load_ns_raw2",
                    "returnType": 2
                },
                {
                    "id": "c8c1e2d1-f9d0-4e2c-b719-70f0ee8f919c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 4,
                    "args": [
                        1,
                        1,
                        2,
                        2
                    ],
                    "externalName": "buffer_save_ns_raw",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "buffer_save_ns_raw",
                    "returnType": 2
                },
                {
                    "id": "27f57983-4537-43b1-9006-2b7403e9ce93",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        1
                    ],
                    "externalName": "string_load_ns",
                    "help": "string_load_ns(path)",
                    "hidden": false,
                    "kind": 11,
                    "name": "string_load_ns",
                    "returnType": 1
                },
                {
                    "id": "61f71fbd-8bf9-44d4-b59f-b0975b83914d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        1,
                        1
                    ],
                    "externalName": "string_save_ns",
                    "help": "string_save_ns(str, path)",
                    "hidden": false,
                    "kind": 11,
                    "name": "string_save_ns",
                    "returnType": 2
                },
                {
                    "id": "762c8021-e31d-4b0b-a81f-b28e6209398e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 3,
                    "args": [
                        1,
                        2,
                        2
                    ],
                    "externalName": "string_codepage",
                    "help": "string_codepage(str, codepage_from, codepage_to) : Converts a string between codepages. From\/to can be set to -1 for UTF-8",
                    "hidden": false,
                    "kind": 11,
                    "name": "string_codepage",
                    "returnType": 1
                }
            ],
            "init": "",
            "kind": 1,
            "order": [
                
            ],
            "origname": "extensions\\nsfs.dll",
            "uncompress": false
        },
        {
            "id": "de9ed444-0347-4b60-8137-3cb2fd5bd264",
            "modelName": "GMExtensionFile",
            "mvc": "1.0",
            "ProxyFiles": [
                
            ],
            "constants": [
                {
                    "id": "5e1c68d6-9312-4d93-8054-5999a95c3bb4",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "nsfs_status",
                    "hidden": false,
                    "value": "nsfs_get_status()"
                },
                {
                    "id": "7df36c00-ecf9-4646-bee8-366c5bfa2fb0",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "nsfs_is_available",
                    "hidden": false,
                    "value": "global.g_nsfs_is_available"
                }
            ],
            "copyToTargets": 113497714299118,
            "filename": "nsfs.gml",
            "final": "",
            "functions": [
                {
                    "id": "b494a52c-8497-4e9e-8d19-a8a7b34ce43d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "nsfs_init",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "nsfs_init",
                    "returnType": 2
                },
                {
                    "id": "f5235c58-7878-4bb5-8da4-d21c64e83d4f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "buffer_load_ns",
                    "help": "buffer_load_ns(nspath, kind = buffer_grow)",
                    "hidden": false,
                    "kind": 11,
                    "name": "buffer_load_ns",
                    "returnType": 2
                },
                {
                    "id": "20ef589d-9f1a-4f0f-b4f1-4c16f0c56b35",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "buffer_save_ns",
                    "help": "buffer_save_ns(buffer)",
                    "hidden": false,
                    "kind": 11,
                    "name": "buffer_save_ns",
                    "returnType": 2
                },
                {
                    "id": "4d2b645c-8c15-49ad-b948-293f28b0ef1c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 4,
                    "args": [
                        2,
                        2,
                        2,
                        2
                    ],
                    "externalName": "buffer_save_ext_ns",
                    "help": "buffer_save_ext_ns(buffer, path, offset, size)",
                    "hidden": false,
                    "kind": 11,
                    "name": "buffer_save_ext_ns",
                    "returnType": 2
                },
                {
                    "id": "f85c6287-145e-4e60-987b-b2d01b74434b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "ini_open_ns",
                    "help": "ini_open_ns(path)",
                    "hidden": false,
                    "kind": 11,
                    "name": "ini_open_ns",
                    "returnType": 2
                },
                {
                    "id": "36413bdf-11d7-47d6-88ae-4ad40539f9fe",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "ini_close_ns",
                    "help": "ini_close_ns()",
                    "hidden": false,
                    "kind": 11,
                    "name": "ini_close_ns",
                    "returnType": 2
                },
                {
                    "id": "a62d43fb-90c6-49f0-a3f6-c85310e6d6c1",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 7,
                    "args": [
                        2,
                        2,
                        2,
                        2,
                        2,
                        2,
                        2
                    ],
                    "externalName": "sprite_replace_ns",
                    "help": "sprite_replace_ns(ind, nspath, imgnumb, removeback, smooth, xorig, yorig)",
                    "hidden": false,
                    "kind": 11,
                    "name": "sprite_replace_ns",
                    "returnType": 2
                },
                {
                    "id": "6addb078-66c0-428c-bc73-870310f374ad",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 6,
                    "args": [
                        2,
                        2,
                        2,
                        2,
                        2,
                        2
                    ],
                    "externalName": "sprite_add_ns",
                    "help": "sprite_add_ns(nspath, imgnumb, removeback, smooth, xorig, yorig)",
                    "hidden": false,
                    "kind": 11,
                    "name": "sprite_add_ns",
                    "returnType": 2
                },
                {
                    "id": "b952edf7-78ae-4a6b-b988-3ba4785a923f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        2,
                        2
                    ],
                    "externalName": "surface_save_ns",
                    "help": "surface_save_ns(surface, nspath)",
                    "hidden": false,
                    "kind": 11,
                    "name": "surface_save_ns",
                    "returnType": 2
                },
                {
                    "id": "2f91faef-cb5b-443b-841e-f6047543b78a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 6,
                    "args": [
                        2,
                        2,
                        2,
                        2,
                        2,
                        2
                    ],
                    "externalName": "surface_save_part_ns",
                    "help": "surface_save_part_ns(surface, nspath, rx, ry, rw, rh)",
                    "hidden": false,
                    "kind": 11,
                    "name": "surface_save_part_ns",
                    "returnType": 2
                },
                {
                    "id": "943ccba1-dc75-42af-a131-df60cf395645",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "screen_save_ns",
                    "help": "screen_save_ns(nspath)",
                    "hidden": false,
                    "kind": 11,
                    "name": "screen_save_ns",
                    "returnType": 2
                },
                {
                    "id": "f52b2e1e-5d98-43af-9019-237d57cbde16",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 5,
                    "args": [
                        2,
                        2,
                        2,
                        2,
                        2
                    ],
                    "externalName": "screen_save_part_ns",
                    "help": "screen_save_part_ns(nspath, rx, ry, rw, rh)",
                    "hidden": false,
                    "kind": 11,
                    "name": "screen_save_part_ns",
                    "returnType": 2
                }
            ],
            "init": "nsfs_init",
            "kind": 2,
            "order": [
                
            ],
            "origname": "extensions\\gml.gml",
            "uncompress": false
        }
    ],
    "gradleinject": "",
    "helpfile": "",
    "installdir": "",
    "iosProps": true,
    "iosSystemFrameworkEntries": [
        
    ],
    "iosThirdPartyFrameworkEntries": [
        
    ],
    "iosdelegatename": "",
    "iosplistinject": "",
    "license": "Proprietary",
    "maccompilerflags": "",
    "maclinkerflags": "",
    "macsourcedir": "",
    "options": null,
    "optionsFile": "options.json",
    "packageID": "cc.yal.nsfs",
    "productID": "F3D00DAD3DDB83EFFDD568E8093FC7AA",
    "sourcedir": "",
    "supportedTargets": 105554163798254,
    "tvosProps": false,
    "tvosSystemFrameworkEntries": [
        
    ],
    "tvosThirdPartyFrameworkEntries": [
        
    ],
    "tvosclassname": "",
    "tvosdelegatename": "",
    "tvosmaccompilerflags": "",
    "tvosmaclinkerflags": "",
    "tvosplistinject": "",
    "version": "1.0.3"
}