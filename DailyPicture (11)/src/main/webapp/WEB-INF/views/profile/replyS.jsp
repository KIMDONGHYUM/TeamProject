<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
	<script>
	var board_no = '${dto.board_no}'; //게시글 번호
	
	
	$('[name=replyInsertBtn]').click(function(){ //댓글 등록 버튼 클릭시 
	    var insertData = $('[name=replyInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴
	    replyInsert(insertData); //Insert 함수호출(아래)
	});
	 
 
 
	//댓글 목록 
	function replyList(){
    $.ajax({
        url : '/list',
        type : 'get',
        data : {'board_no':board_no}    /*{'writer': writer} */
        success : function(data){
            var a =''; 
            $.each(data, function(key, value){ 
                a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
                a += '<div class="commentInfo'+value.reply_no+'">'+'댓글번호 : '+value.reply_no+' / 작성자 : '+value.user_id;
                a += '<a onclick="commentUpdate('+value.reply_no+',\''+value.content+'\');"> 수정 </a>';
                a += '<a onclick="commentDelete('+value.reply_no+');"> 삭제 </a> </div>';
                a += '<div class="commentContent'+value.reply_no+'"> <p> 내용 : '+value.content +'</p>';
                a += '</div></div>';
            });
            
            $(".replyList").html(a);
        }
    });
}
 
//댓글 등록
function replyInsert(insertData){
    $.ajax({
        url : '/insert',
        type : 'post',
        data : insertData,
        success : function(data){
            if(data == 1) {
                replyList(); //댓글 작성 후 댓글 목록 reload
                $('[name=content]').val('');
            }
        }
    });
}
 
/* //댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
function replyUpdate(reply_no, content){
    var a ='';
    
    a += '<div class="input-group">';
    a += '<input type="text" class="form-control" name="content_'+reply_no+'" value="'+content+'"/>';
    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+cno+');">수정</button> </span>';
    a += '</div>';
    
    $('.replyContent'+reply_no).html(a);
    
} */
 
/* //댓글 수정
function commentUpdateProc(cno){
    var updateContent = $('[name=content_'+cno+']').val();
    
    $.ajax({
        url : '/comment/update',
        type : 'post',
        data : {'content' : updateContent, 'cno' : cno},
        success : function(data){
            if(data == 1) commentList(bno); //댓글 수정후 목록 출력 
        }
    });
}
 
//댓글 삭제 
function commentDelete(cno){
    $.ajax({
        url : '/comment/delete/'+cno,
        type : 'post',
        success : function(data){
            if(data == 1) commentList(bno); //댓글 삭제후 목록 출력 
        }
    });
} */
 
 
 
 
	$(document).ready(function(){
	    replyList(); //페이지 로딩시 댓글 목록 출력 
	});
 
 
 
</script>


