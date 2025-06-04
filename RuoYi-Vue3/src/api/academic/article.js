import request from '@/utils/request'

// 查询学术文章，管理学术研究类文章信息列表
export function listArticle(query) {
  return request({
    url: '/academic/article/list',
    method: 'get',
    params: query
  })
}

// 查询学术文章，管理学术研究类文章信息详细
export function getArticle(id) {
  return request({
    url: '/academic/article/' + id,
    method: 'get'
  })
}

// 新增学术文章，管理学术研究类文章信息
export function addArticle(data) {
  return request({
    url: '/academic/article',
    method: 'post',
    data: data
  })
}

// 修改学术文章，管理学术研究类文章信息
export function updateArticle(data) {
  return request({
    url: '/academic/article',
    method: 'put',
    data: data
  })
}

// 删除学术文章，管理学术研究类文章信息
export function delArticle(id) {
  return request({
    url: '/academic/article/' + id,
    method: 'delete'
  })
}
