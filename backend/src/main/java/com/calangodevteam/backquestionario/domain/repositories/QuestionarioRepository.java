package com.calangodevteam.backquestionario.domain.repositories;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.calangodevteam.backquestionario.domain.models.Questionario;

public interface QuestionarioRepository extends JpaRepository<Questionario, Integer>{

    Page<Questionario> findAll(Pageable pageable);

	@Transactional(readOnly = true)
	@Query(
		    value = """
		        select q
		        from Questionario q
		        left join Resultado r
		        where r.aluno.id IS NULL OR r.aluno.id <> :alunoId
		        """,
		    countQuery = """
		        select count(q)
		        from Questionario q
		        left join Resultado r
		        where r.aluno.id IS NULL OR r.aluno.id <> :alunoId
		        """
		)
    Page<Questionario> findAllByNotAluno(@Param("alunoId") Integer alunoId, Pageable pageable);

}