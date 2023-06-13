module.exports = function (Sequelize,DataTypes){ //el modelo exporta una funcion
    
    //definir un alias que va a ser el nombre con el que vamos a llamar al modelo cuando estemos en el controlador
    let alias = 'Producto';

    //columnas y sus propiedades
    let cols = {
        id:{
            primaryKey: true,
            notNull: true,
            type: DataTypes.INTEGER(10).UNSIGNED,
        },
        imgProd:{
            type: DataTypes.TEXT
        },
        usuarioId:{
            notNull:true,
            type: DataTypes.INTEGER(10).UNSIGNED,
        },
        producto:{
            notNull: true,
            type: DataTypes.STRING,
        },
        descripcionProd:{
            notNull: true,
            type: DataTypes.STRING,
        },
        createdAt:{
            notNull: true,
            type: DataTypes.DATE,
            defaultValue: Sequelize.literal('CURRENT_TIMESTAMP'),
        },
        updatedAt:{
            type: DataTypes.DATE,
            defaultValue: Sequelize.literal('CURRENT_TIMESTAMP')        
        },
    }
    //CONFIGURACIONES ADICIONALES
    let config = { //puede no estar, cuando el nombre de la tabla es el nombre del modelo en plural
        tableName: 'productos',
        timestamps: true, //le dice al modelo si la tabla estan las columnas updatedAt y createdAt
        underscored: false, //si la tabla tiene columnas con nombres usando _.
    }
    const Producto = Sequelize.define(alias, cols, config);

    //Relaciones entre tablas --> un telefono (1) pertenece a un usuario (n)

    Producto.associate = function(models){
        Producto.belongsTo(models.Usuario,
            {
                as: 'owner',
                foreignKey: 'usuarioId'
            });
        Producto.hasMany(models.Comentario,
            {
                as: 'comentarios',
                foreignKey: 'postId'
            });
    }

    return Producto;
}