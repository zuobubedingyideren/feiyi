import request from '@/utils/request'

// 查询项目图片列表
export function listImage(query) {
  return request({
    url: '/catalog/image/list',
    method: 'get',
    params: query
  })
}

// 查询项目图片详细
export function getImage(id) {
  return request({
    url: '/catalog/image/' + id,
    method: 'get'
  })
}

// 新增项目图片
export function addImage(data) {
  return request({
    url: '/catalog/image',
    method: 'post',
    data: data
  })
}

// 修改项目图片
export function updateImage(data) {
  return request({
    url: '/catalog/image',
    method: 'put',
    data: data
  })
}

// 删除项目图片
export function delImage(id) {
  return request({
    url: '/catalog/image/' + id,
    method: 'delete'
  })
}
