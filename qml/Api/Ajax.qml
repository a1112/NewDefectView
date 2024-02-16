import QtQuick 2.15
Item {

    function get(url, success, failure)
    {
        var xhr = new XMLHttpRequest;
        xhr.open("GET", url);
        xhr.onreadystatechange = function() {
            handleResponse(xhr, success, failure);
        }
        xhr.send();
    }

    // POST
    function post(url, arg, success, failure)
    {
        var xhr = new XMLHttpRequest;
        xhr.open("POST", url);
        xhr.setRequestHeader("Content-Length", arg.length);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;");  //用POST的时候一定要有这句
        xhr.onreadystatechange = function() {
            handleResponse(xhr, success, failure);
        }
        xhr.send(arg);
    }

    function postJson(url, data, success, failure){
        var xhr = new XMLHttpRequest();

        // 打开一个 POST 请求，并将请求头设置为 "Content-Type: application/json"
        xhr.open("POST", url, true);
        xhr.setRequestHeader("Content-Type", "application/json");

        // 将 JSON 数据字符串化为 JSON 对象
        var json = JSON.stringify(data);

        // 使用 send() 方法发送 JSON 对象
        xhr.send(json);
        // 监听 readystatechange 事件，并在请求完成时处理响应
        xhr.onreadystatechange = function() {
          handleResponse(xhr, success, failure);
        };

    }


    // 处理返回值
    function handleResponse(xhr, success, failure){
        if (xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status ===  200){
                if (success !== null && success !== undefined)
                {
                    var result = xhr.responseText;
                                   success(result);
    //                    try{
    //                        success(result);
    //                    }catch(e){
    //                        success(result);
    //                    }
                }
            }
            else{
                if (failure !== null && failure !== undefined)
                    failure(xhr.responseText, xhr.status);
            }
        }
    }

}
