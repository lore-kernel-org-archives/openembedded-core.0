Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5412060EDC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 00:08:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8C08T7P002173
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 17:08:29 -0700 (PDT)
Received: from [128.224.162.168] (128.224.162.168) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Wed, 11 Sep 2013 17:08:29 -0700
Message-ID: <523105FE.3070904@windriver.com>
Date: Thu, 12 Sep 2013 08:08:30 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1378276893.git.rongqing.li@windriver.com>
In-Reply-To: <cover.1378276893.git.rongqing.li@windriver.com>
Subject: Re: [PATCH 0/2] make runlevel to return correct value
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
X-List-Received-Date: Thu, 12 Sep 2013 00:08:30 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

ping...

-Roy

On 09/04/2013 02:56 PM, rongqing.li@windriver.com wrote:
> From: "Roy.Li" <rongqing.li@windriver.com>
>
> The following changes since commit 8c272641ef3e8410f331ca4133d28dea8f36e4f4:
>
>    lib/oeqa/runtime: smart: serve repo on host ip only and increase timeout (2013-09-03 19:57:31 +0100)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib roy/systemd-1
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=roy/systemd-1
>
> Roy.Li (2):
>    systemd-compat-units: do not create runlevel command
>    systemd: link runlevel from systemctl
>
>   meta/recipes-core/systemd/systemd-compat-units.bb |    5 -----
>   meta/recipes-core/systemd/systemd_206.bb          |    6 +++++-
>   2 files changed, 5 insertions(+), 6 deletions(-)
>

-- 
Best Reagrds,
Roy | RongQing Li

