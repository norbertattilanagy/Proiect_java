package net.codejava.test.model;

import jakarta.persistence.*;

@Entity
@Table(name = "check_option")
public class CheckOption {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", nullable = false)
    private Long id;

    private Long noteId;
    private String option;
    private Boolean checked;

    public CheckOption(Long id, Long noteId, String option, Boolean checked) {
        this.id = id;
        this.noteId = noteId;
        this.option = option;
        this.checked = checked;
    }

    public CheckOption(Long noteId, String option, Boolean checked) {
        this.noteId = noteId;
        this.option = option;
        this.checked = checked;
    }

    public CheckOption() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getNoteId() {
        return noteId;
    }

    public void setNoteId(Long noteId) {
        this.noteId = noteId;
    }

    public String getOption() {
        return option;
    }

    public void setOption(String option) {
        this.option = option;
    }

    public Boolean getChecked() {
        return checked;
    }

    public void setChecked(Boolean checked) {
        this.checked = checked;
    }
}
