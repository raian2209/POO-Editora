package Models.VO;

public class AvaliacaoVO {
    private String avaliador;
    private String tituloObra;
//    private
    public void setAvaliador(String avaliador) {
        this.avaliador = avaliador;
    }

    public void setTituloObra(String tituloObra) {
        this.tituloObra = tituloObra;
    }

    public String getTituloObra() {
        return tituloObra;
    }

    public String getAvaliador() {
        return avaliador;
    }


}
