import request from '@/utils/request'

// 查询照片，管理影集中的照片列表
export function listPhoto(query) {
  return request({
    url: '/resource/photo/list',
    method: 'get',
    params: query
  })
}

// 查询照片，管理影集中的照片详细
export function getPhoto(id) {
  return request({
    url: '/resource/photo/' + id,
    method: 'get'
  })
}

// 新增照片，管理影集中的照片
export function addPhoto(data) {
  return request({
    url: '/resource/photo',
    method: 'post',
    data: data
  })
}

// 修改照片，管理影集中的照片
export function updatePhoto(data) {
  return request({
    url: '/resource/photo',
    method: 'put',
    data: data
  })
}

// 删除照片，管理影集中的照片
export function delPhoto(id) {
  return request({
    url: '/resource/photo/' + id,
    method: 'delete'
  })
}
