import request from '@/utils/request'

// 查询热门项目列表
export function listHot(query) {
  return request({
    url: '/home/hot/list',
    method: 'get',
    params: query
  })
}

// 查询热门项目详细
export function getHot(id) {
  return request({
    url: '/home/hot/' + id,
    method: 'get'
  })
}

// 新增热门项目
export function addHot(data) {
  return request({
    url: '/home/hot',
    method: 'post',
    data: data
  })
}

// 修改热门项目
export function updateHot(data) {
  return request({
    url: '/home/hot',
    method: 'put',
    data: data
  })
}

// 删除热门项目
export function delHot(id) {
  return request({
    url: '/home/hot/' + id,
    method: 'delete'
  })
}
