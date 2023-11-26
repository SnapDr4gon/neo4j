from neo4j import GraphDatabase

class Neo4jCRUD:
    def __init__(self, uri, username, password):
        self._driver = GraphDatabase.driver(uri, auth=(username, password))

    def close(self):
        self._driver.close()

    def create_node(self, label, properties):
        with self._driver.session() as session:
            query = (
                f"CREATE (n:{label} $properties) RETURN n"
            )
            result = session.run(query, properties=properties)
            return result.single()[0]

    def read_nodes(self, label=None):
        with self._driver.session() as session:
            if label:
                query = (
                    f"MATCH (n:{label}) RETURN n"
                )
            else:
                query = (
                    "MATCH (n) RETURN n"
                )
            result = session.run(query)
            return [record['n'] for record in result]

    def update_node(self, node_id, properties):
        with self._driver.session() as session:
            query = (
                "MATCH (n) WHERE id(n) = $node_id SET n += $properties RETURN n"
            )
            result = session.run(query, node_id=node_id, properties=properties)
            return result.single()[0]

    def delete_node(self, node_id):
        with self._driver.session() as session:
            query = (
                "MATCH (n) WHERE id(n) = $node_id DELETE n"
            )
            session.run(query, node_id=node_id)

def print_menu():
    print("CRUD Operations:")
    print("1. Create Node")
    print("2. Read Nodes")
    print("3. Update Node")
    print("4. Delete Node")
    print("5. Exit")

def input_node_data():
    properties = {}
    while True:
        prop_key = input("Enter property key (empty to finish): ")
        if not prop_key:
            break
        prop_value = input(f"Enter value for {prop_key}: ")
        properties[prop_key] = prop_value
    return properties

def main():
    uri = "bolt://localhost:7687"  # Tu URL de conexión
    username = "Jared"     # Tu usuario
    password = "administrador"     # Tu contraseña

    crud = Neo4jCRUD(uri, username, password)

    while True:
        print_menu()
        choice = input("Enter your choice (1-5): ")

        if choice == "1":
            label = input("Enter node label: ")
            properties = input_node_data()
            node = crud.create_node(label, properties)
            print(f"Node created: {node}")

        elif choice == "2":
            label = input("Enter node label (leave empty for all nodes): ")
            nodes = crud.read_nodes(label)
            for node in nodes:
                print(node)

        elif choice == "3":
            node_id = input("Enter node ID to update: ")
            properties = input_node_data()
            updated_node = crud.update_node(node_id, properties)
            print(f"Node updated: {updated_node}")

        elif choice == "4":
            node_id = input("Enter node ID to delete: ")
            crud.delete_node(node_id)
            print(f"Node with ID {node_id} deleted")

        elif choice == "5":
            print("Exiting...")
            break

    crud.close()

if __name__ == "__main__":
    main()
