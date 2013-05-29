Return-Path: <Ning.Zhang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 807CD6A487
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 09:28:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r4T9Sss9005913
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 02:28:54 -0700 (PDT)
Received: from [128.224.162.247] (128.224.162.247) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Wed, 29 May 2013 02:28:53 -0700
Message-ID: <51A5CA51.6080807@windriver.com>
Date: Wed, 29 May 2013 17:28:49 +0800
From: ning <ning.zhang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130221 Thunderbird/17.0.3
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1369814765.git.ning.zhan@windriver.com>
In-Reply-To: <cover.1369814765.git.ning.zhan@windriver.com>
X-Originating-IP: [128.224.162.247]
Subject: Re: [PATCH 0/1] check current items before add a new one
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
X-List-Received-Date: Wed, 29 May 2013 09:28:54 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

Some comments in this patch are wrong, please ignore this mail, i will 
send a new patch soon.

Thanks.

On 05/29/2013 04:14 PM, Ning Zhang wrote:
> From: Zhang Ning <ning.zhan@windriver.com>
>
> The following changes since commit 676fd3f394a0c0576b63c77ed2184bf5f42c29b6:
>
>    dropbear: a fix for hang in dropbearkey, built for x32 (2013-05-24 14:14:49 +0100)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib ning/bug4558
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ning/bug4558
>
> Zhang Ning (1):
>    yocto_kernel: check current items before add a new one
>
>   scripts/lib/bsp/kernel.py |   32 +++++++++++++++++++++-----------
>   1 file changed, 21 insertions(+), 11 deletions(-)
>


