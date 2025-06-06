import request from '@/utils/request'

// 查询UNESCO非遗名录，管理联合国教科文组织非遗名录信息列表
export function listHeritage(query) {
  return request({
    url: '/catalog/heritage/list',
    method: 'get',
    params: query
  })
}

// 查询UNESCO非遗名录，管理联合国教科文组织非遗名录信息详细
export function getHeritage(id) {
  return request({
    url: '/catalog/heritage/' + id,
    method: 'get'
  })
}

// 新增UNESCO非遗名录，管理联合国教科文组织非遗名录信息
export function addHeritage(data) {
  return request({
    url: '/catalog/heritage',
    method: 'post',
    data: data
  })
}

// 修改UNESCO非遗名录，管理联合国教科文组织非遗名录信息
export function updateHeritage(data) {
  return request({
    url: '/catalog/heritage',
    method: 'put',
    data: data
  })
}

// 删除UNESCO非遗名录，管理联合国教科文组织非遗名录信息
export function delHeritage(id) {
  return request({
    url: '/catalog/heritage/' + id,
    method: 'delete'
  })
}
