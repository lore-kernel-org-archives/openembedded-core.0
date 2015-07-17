Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 675B4758E6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jul 2015 08:54:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6H8sAbe022616
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jul 2015 01:54:10 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Fri, 17 Jul 2015 01:54:10 -0700
To: <openembedded-core@lists.openembedded.org>
References: <cover.1436147616.git.kai.kang@windriver.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <55A8C2B4.1020804@windriver.com>
Date: Fri, 17 Jul 2015 16:54:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <cover.1436147616.git.kai.kang@windriver.com>
Subject: Re: [PATCH 0/1] Fix can not stop systemd service var-volatile-lib
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Jul 2015 08:54:11 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2015年07月06日 09:59, Kai Kang wrote:
> The following changes since commit 8ad9a434c9fd0300cf5c38c368b181b78421e95a:
>
>    bitbake: tests/data: Add new data tests (2015-07-01 15:40:21 +0100)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib kangkai/volatile-binds
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=kangkai/volatile-binds
>
> Kai Kang (1):
>    volatile-binds: correct path of command umount

Ping?


>
>   meta/recipes-core/volatile-binds/volatile-binds.bb | 1 +
>   1 file changed, 1 insertion(+)
>


-- 
Regards,
Neil | Kai Kang


