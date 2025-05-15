package Models.VO;

public class ObrasVO {
    private String titulo;
    private String genero;
    private int ano;
    private String autor;

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public void setAno(int ano) {
        this.ano = ano;
    }

    public void setAutor(String autor) {
        this.autor = autor;
    }

    public int getAno() {
        return ano;
    }

    public String getAutor() {
        return autor;
    }

    public String getGenero() {
        return genero;
    }

    public String getTitulo() {
        return titulo;
    }






}
