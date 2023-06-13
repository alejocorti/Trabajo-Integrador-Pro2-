module.exports = function (Sequelize,DataTypes){ //el modelo exporta una funcion
    
    //definir un alias que va a ser el nombre con el que vamos a llamar al modelo cuando estemos en el controlador
    let alias = 'Comentario';

    //columnas y sus propiedades
    let cols = {
        id:{
            primaryKey: true,
            autoIncrement: true,
            type: DataTypes.INTEGER,
        },
        postId:{
            notNull: true,
            type: DataTypes.INTEGER(10).UNSIGNED,
        },
        usuarioId: {
            notNull: true,
            type: DataTypes.INTEGER(10).UNSIGNED,
        },
        comentario:{
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
            defaultValue: Sequelize.literal('CURRENT_TIMESTAMP'),
        }
    }
    //CONFIGURACIONES ADICIONALES
    let config = { 
        tableName: 'comentarios',//puede no estar, cuando el nombre de la tabla es el nombre del modelo en plural
        timestamps: true, //le dice al modelo si la tabla estan las columnas updatedAt y createdAt
        
    }
    const Comentario = Sequelize.define(alias, cols, config);

    //Relaciones entre tablas

    Comentario.associate = function(models){
        Comentario.belongsTo(models.Producto,
            {
                as: 'productoComentado',
                foreignKey: 'postId'
            });

        Comentario.belongsTo(models.Usuario,
            {
                as: 'comentador',
                foreignKey: 'usuarioId'
            });

    }

    return Comentario;
}