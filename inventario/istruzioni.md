### arma.gd
contiene i metodi per selezionare l'arma del player,
script da affidare ad un nodo
- ricordare di selezionare l'arma nell'ispettore (per il momento)

la variabile *arma* rappresenta l'arma che sta usando al momento il gicoatore
- si può accedere ai dati dell'arma contenuti nel json così:
  - arma.danno, arma.parata, arma.tipo_di_danno
   ##### oppure
   - arma["danno"], arma["parata"], arma["tipo_di_danno"]

la variabile *nomeArma* è una variabile di debug che verrà rimossa in futuro
serve per inizializzare l'arma da usare in test, piu avanti si userà solo il metodo

### inventario.gd
- caricare lo script come autoload : progetto>impostazioni del progetto>Globali>aggiungi percorso>aggiungi
- assicurarsi che il file json abbia lo stesso nome del path
- per chiamare questo file ( se non cambia nome ) :ex: Inventario.nomeMetodo()

### weapons.json
- contenitore dati delle armi
