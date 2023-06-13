module.exports = function (Sequelize,DataTypes){

    let alias="Usuario"
    let cols={
        id:{
            autoIncrement: true,
            notNull: true,
            primaryKey:true,
            type: DataTypes.INTEGER(10).UNSIGNED,
        },
        email:{
            notNull: true,
            type: DataTypes.STRING,
            
        },
        contrasenia:{
            notNull: true,
            type: DataTypes.STRING,
        },
        fechaDeNacimiento:{
            notNull: true,
            type: DataTypes.DATEONLY,
        },
        dni:{
            notNull: true,
            type: DataTypes.INTEGER(10).UNSIGNED,
        },
        fotoDePerfil:{
            notNull: true,
            type: DataTypes.STRING,
        },
        createdAt:{
            notNull: true,
            type: DataTypes.DATE,
            defaultValue: 'curdate()',
            defaultValue: Sequelize.literal('CURRENT_TIMESTAMP'),
        },
        updatedAt:{
            type: DataTypes.DATE,
            defaultValue: 'curdate()',
            defaultValue: Sequelize.literal('CURRENT_TIMESTAMP'),
        }
        
    }
    let config={
        tableName: 'usuarios',
        timestamps: true, //le dice al modelo si la tabla estan las columnas updatedAt y createdAt
        underscored: false,

    }
    const Usuario = Sequelize.define(alias, cols, config);
    
    Usuario.associate = function(models){
        Usuario.hasMany( models.Producto, 
            {
                as: 'productos',
                foreignKey: 'id'
            });

        Usuario.hasMany(models.Comentario,
            {
                as: 'comentarios',
                foreignKey: 'id'
            });
    }

    return Usuario;
    }