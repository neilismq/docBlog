// nav
module.exports = [
  { text: '首页', link: '/' },
  {
    text: '工作日志',
    link: '/workLog/'
  },
  {
    text: 'Java基础',
    link: '/javaBase/'
  },
  {
    text: '常见中间件',
    link:'/popularMedContains',
    items: [
      {
        text: 'Redis',
        link: '/pages/ee8dbb/',
      }
    ]
  },
  {
    text: '分类',
    link: '/categories/'
  },
  {
    text: '标签',
    link: '/tags/'
  },
  {
    text: '归档',
    link: '/archives/'
  },
]