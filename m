Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4B2BC727D9
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Jan 2015 01:47:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t041lSo5027014
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 3 Jan 2015 17:47:29 -0800 (PST)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Sat, 3 Jan 2015 17:47:28 -0800
Message-ID: <54A89BAD.50602@windriver.com>
Date: Sun, 4 Jan 2015 09:47:25 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1419500687.git.Chong.Lu@windriver.com>
In-Reply-To: <cover.1419500687.git.Chong.Lu@windriver.com>
X-Originating-IP: [128.224.162.204]
Subject: Re: [PATCH 0/1] check-layers.py: some checks for distro and bsp layer
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
X-List-Received-Date: Sun, 04 Jan 2015 01:47:32 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

ping

On 12/25/2014 05:45 PM, Chong Lu wrote:
> The following changes since commit e3a623bfe39fda16420d2042647af75877bb6f70:
>
>    runqemu-internal: increase memory for qemuarm64 (2014-12-25 08:27:13 +0000)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib chonglu/checklayer
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/checklayer
>
> Chong Lu (1):
>    check-layers.py: some checks for distro and bsp layer
>
>   scripts/contrib/check-layers.py | 248 ++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 248 insertions(+)
>   create mode 100755 scripts/contrib/check-layers.py
>


