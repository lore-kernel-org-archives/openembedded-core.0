Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1436373695
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Oct 2015 09:17:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t9T9HfR9013619
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Oct 2015 02:17:41 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 29 Oct 2015 02:17:40 -0700
To: <openembedded-core@lists.openembedded.org>
References: <cover.1444976827.git.kai.kang@windriver.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <5631E434.7010006@windriver.com>
Date: Thu, 29 Oct 2015 17:17:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <cover.1444976827.git.kai.kang@windriver.com>
Subject: Re: [PATCH 0/1] Upgrade sqlite to 3.9.0
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
X-List-Received-Date: Thu, 29 Oct 2015 09:17:44 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2015年10月16日 14:28, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
>
> The following changes since commit e35c404537db0b46047fcb2ee7d3645e3e0935c5:
>
>    bitbake: toaster: Don't descend into directories for cached_layers (2015-10-11 08:12:58 +0100)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib kangkai/sqlite3
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=kangkai/sqlite3
>
> Kai Kang (1):
>    sqlite: 3.8.10.2 -> 3.9.0

Ping.


>
>   .../files/0001-using-the-dynamic-library.patch     | 30 ----------------------
>   .../{sqlite3_3.8.10.2.bb => sqlite3_3.9.0.bb}      | 10 ++++----
>   2 files changed, 5 insertions(+), 35 deletions(-)
>   delete mode 100644 meta/recipes-support/sqlite/files/0001-using-the-dynamic-library.patch
>   rename meta/recipes-support/sqlite/{sqlite3_3.8.10.2.bb => sqlite3_3.9.0.bb} (72%)
>


-- 
Regards,
Neil | Kai Kang


