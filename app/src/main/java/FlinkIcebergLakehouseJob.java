import org.apache.flink.streaming.api.environment.StreamExecutionEnvironment;
import org.apache.flink.table.api.EnvironmentSettings;
import org.apache.flink.table.api.TableEnvironment;

public class FlinkIcebergLakehouseJob {
    public static void main(String[] args) throws Exception {
        // 1. Entorno de ejecución
        StreamExecutionEnvironment env = StreamExecutionEnvironment.getExecutionEnvironment();
        env.enableCheckpointing(60000); // cada 1 minuto

        // 2. Configuración de TableEnvironment
        EnvironmentSettings settings = EnvironmentSettings.newInstance()
                .inStreamingMode()
                .build();
        TableEnvironment tEnv = TableEnvironment.create(settings);

        // 3. Registrar el catálogo Glue
        tEnv.executeSql(
            "CREATE CATALOG glue_catalog WITH (" +
            "  'type'='iceberg'," +
            "  'catalog-impl'='org.apache.iceberg.aws.glue.GlueCatalog'," +
            "  'warehouse'='s3://infraestructura-transporte-dev-lakehouse/'," +
            "  'catalog-id'='lakehouse_dev'" +
            ")"
        );

        // 4. Usar la base de datos declarada en Terraform
        tEnv.executeSql("USE CATALOG glue_catalog");
        tEnv.executeSql("USE lakehouse_dev");

        // 5. Crear tabla Iceberg (si no existe)
        tEnv.executeSql(
            "CREATE TABLE IF NOT EXISTS transporte_table (" +
            "  id_transporte STRING," +
            "  fecha_evento TIMESTAMP," +
            "  ubicacion STRING" +
            ") PARTITIONED BY (fecha_evento)"
        );

        // 6. Insertar datos simulados (para prueba de persistencia)
        tEnv.executeSql(
            "INSERT INTO transporte_table VALUES " +
            "('bus-001', CURRENT_TIMESTAMP, 'Rosario')," +
            "('bus-002', CURRENT_TIMESTAMP, 'Santa Fe')"
        );

        env.execute("Flink Iceberg Lakehouse Job");
    }
}
