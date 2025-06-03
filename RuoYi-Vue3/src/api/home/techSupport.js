import request from '@/utils/request'

// 查询技术支持列表
export function listTechSupport(query) {
  return request({
    url: '/home/techSupport/list',
    method: 'get',
    params: query
  })
}

// 查询技术支持详细
export function getTechSupport(footerId) {
  return request({
    url: '/home/techSupport/' + footerId,
    method: 'get'
  })
}

// 新增技术支持
export function addTechSupport(data) {
  return request({
    url: '/home/techSupport',
    method: 'post',
    data: data
  })
}

// 修改技术支持
export function updateTechSupport(data) {
  return request({
    url: '/home/techSupport',
    method: 'put',
    data: data
  })
}

// 删除技术支持
export function delTechSupport(footerId) {
  return request({
    url: '/home/techSupport/' + footerId,
    method: 'delete'
  })
}
