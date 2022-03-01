<template>
    <v-layout align-start>
        <v-flex>
            <v-toolbar flat color="white">
                <v-toolbar-title>Categorías</v-toolbar-title>
                    <v-divider
                    class="mx-2"
                    inset
                    vertical
                    ></v-divider>
                    <v-spacer></v-spacer>
                    <v-text-field class="text-xs-center" v-model="search" append-icon="search" label="Búsqueda" single-line hide-details></v-text-field>
                    <v-spacer></v-spacer>
                    <v-dialog v-model="dialog" max-width="500px">
                        <v-btn slot="activator" color="primary" dark class="mb-2">Nuevo</v-btn>
                        <v-card>
                            <v-card-title>
                            <span class="headline">{{ formTitle }}</span>
                            </v-card-title>
                
                            <v-card-text>
                            <v-container grid-list-md>
                                <v-layout wrap>
                                <v-flex xs12 sm12 md12>
                                    <v-text-field v-model="name" label="Nombre"></v-text-field>
                                </v-flex>
                                <v-flex xs12 sm12 md12>
                                    <v-text-field v-model="description_category" label="Descripción"></v-text-field>
                                </v-flex>
                                <v-flex xs12 sm12 md12>
                                    <v-text-field type="date" v-model="registration_date" label="Fecha registro"></v-text-field>
                                </v-flex>
                               <!-- <v-flex xs12 sm12 md12 v-show="valida">
                                    <div class="red--text" v-for="v in validaMensaje" :key="v" v-text="v">
                                    </div>
                                </v-flex>-->
                                </v-layout>
                            </v-container>
                            </v-card-text>
                
                            <v-card-actions>
                                <v-spacer></v-spacer>
                                <v-btn color="blue darken-1" flat @click.native="close">Cancelar</v-btn>
                                <v-btn color="blue darken-1" flat @click.native="guardar">Guardar</v-btn>
                            </v-card-actions>
                        </v-card>
                    </v-dialog>
                    
                </v-toolbar>
            <v-data-table
                :headers="headers"
                :items="categories"
                :search="search"
                class="elevation-1"
            >
                <template slot="items" slot-scope="props">
                    <td class="justify-center layout px-0">
                        <v-icon
                        small
                        class="mr-2"
                        @click="editItem(props.item)"
                        >
                        edit
                        </v-icon>
                        <template v-if="props.item.condicion">
                            <v-icon
                            small
                            @click="activarDesactivarMostrar(2,props.item)"
                            >
                            block
                            </v-icon>
                        </template>
                        <template v-else>
                            <v-icon
                            small
                            @click="activarDesactivarMostrar(1,props.item)"
                            >
                            check
                            </v-icon>
                        </template>
                    </td>
                    <td>{{ props.item.name }}</td>
                    <td>{{ props.item.description_category}}</td>
                    <td>{{ props.item.registration_date}}</td>
                    <td>
                        <div v-if="props.item.condition">
                            <span class="blue--text">Activo</span>
                        </div>
                        <div v-else>
                            <span class="red--text">Inactivo</span>
                        </div>
                    </td>
                </template>
                <template slot="no-data">
                <v-btn color="primary" @click="listar">Resetear</v-btn>
                </template>
            </v-data-table>
        </v-flex>
    </v-layout>
</template>
<script>
    import axios from 'axios'
    export default {
        data(){
            return {
                categories:[],                
                dialog: false,
                headers: [
                    { text: 'Opciones', value: 'opciones', sortable: false },
                    { text: 'Nombre', value: 'name' },
                    { text: 'Descripción', value: 'description_category', sortable: false  },
                    { text: 'Fecha', value: 'registration_date', sortable: false  },
                    { text: 'Estado', value: 'condition', sortable: false  }      
                              
                ],
                search: '',
                editedIndex: -1,
                editedItem: {
                    name: '',
                    calories: 0,
                    fat: 0,
                    carbs: 0,
                    protein: 0
                },
                idcategory: '',
                name: '',
                description_category: '',
                registration_date: '',

                          
            }
        },
        computed: {
            formTitle () {
                return this.editedIndex === -1 ? 'Nueva categoría' : 'Actualizar categoría'
            }
        },

        watch: {
            dialog (val) {
            val || this.close()
            }
        },

        created () {
            this.listar();
        },
        methods:{
            listar(){
                let me=this;
                axios.get('api/Marcajes').then(function(response){
                    //'api/Categories
                    //console.log(response);
                    me.categories=response.data;
                }).catch(function(error){
                    console.log(error);
                });
            },
            editItem (item) {
                this.idcategory=item.idcategory;
                this.name=item.name;
                this.description_category=iten.description_category;
                this.registration_date=item.registration_date;
                this.editedIndex=1;
                this.dialog = true
            },

            deleteItem (item) {
                const index = this.desserts.indexOf(item)
                confirm('Are you sure you want to delete this item?') && this.desserts.splice(index, 1)
            },

            close () {
                this.dialog = false;
                
            },
            limpiar(){
                this.idcategory="";
                this.name="";
                this.descripcion_category="";
                this.registration_date="";
                this.editedIndex=-1;
            },
            guardar () {
                if(this.validar()){
                    return;
                }
            
                if (this.editedIndex > -1) {
                    //Código para editar
                    //Código para guardar
                    
                } else {
                    //Código para guardar
                    let me=this;
                    axios.post('api/Categories',{
                        'Nombre': me.name,
                        'Descripcion': me.description_category,
                        'Fecha':  me.registration_date
                    }).then(function(response){
                            me.close();
                            me.listar();
                            me.limpiar();             
                    }).catch(function(error){
                        console.log(error);

                        });
                    }
                },
                validar (){
                    this.valida=0;
                    this.validaMensaje=[];

                    if (thi.name.legth<3 || this.name.legth>50){
                        thi.validaMensaje.push("El nombre debe tener mas de 3 caracteres y menos de 50 caracteres");
                    }
                    if(this.validaMensaje.legth){
                        this.valida=1;
                    }
                    return this.valida;

                }   
            }
        }
    
</script>
