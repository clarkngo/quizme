package com.clarkngo.quizme.web.dao;

import com.clarkngo.quizme.web.config.MySqlDS;
import com.clarkngo.quizme.web.domain.Choice;
import com.clarkngo.quizme.web.domain.Question;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ChoiceDao {

    private DataSource ds;
    private Connection conn;


    public ChoiceDao() {
        this.ds = MySqlDS.getDs();
    }

    public List<Choice> getChoices(int id) {
        List<Choice> choices = new ArrayList<>();
        PreparedStatement ps = null;
        try {
            this.conn = ds.getConnection();
            ps = conn.prepareStatement("SELECT c.Id AS ChoiceId, c.Description AS ChoiceDescription, c.IsAnswer AS ChoiceIsAnswer FROM choice AS c INNER JOIN question AS qu ON qu.Id=c.Fk_QuestionId_Choice WHERE qu.Id=?");
            ps.setInt(1,id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Choice c = new Choice();
                c.setChoiceId(rs.getInt("ChoiceId"));
                c.setDescription(rs.getString("ChoiceDescription"));
                c.setIsAnswer(rs.getInt("ChoiceIsAnswer"));
                choices.add(c);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return choices;
    }
}
