Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RVQFy-0000lf-3B
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 17:10:06 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 29 Nov 2011 08:03:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="81175340"
Received: from unknown (HELO [10.255.15.251]) ([10.255.15.251])
	by orsmga002.jf.intel.com with ESMTP; 29 Nov 2011 08:03:26 -0800
Message-ID: <4ED5024D.9070005@linux.intel.com>
Date: Tue, 29 Nov 2011 08:03:25 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1322074182.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1322074182.git.otavio@ossystems.com.br>
Subject: Re: [PATCH 0/1] Xorg fix
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Nov 2011 16:10:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/23/2011 10:50 AM, Otavio Salvador wrote:
> The following changes since commit b7ffe94a17df389644bc216c56f4b339fcb06362:
>
>    distro_tracking_fields: Update after Manual Check (2011-11-23 16:14:19 +0000)
>
> are available in the git repository at:
>    git://github.com/OSSystems/oe-core master
>    https://github.com/OSSystems/oe-core/tree/HEAD
>
> Otavio Salvador (1):
>    xserver-xorg: only use --disable-dga in xserver-xorg-lite
>
>   .../xorg-xserver/xserver-xorg-1.11.1.inc           |    2 +-
>   .../xorg-xserver/xserver-xorg-common.inc           |    1 -
>   .../xorg-xserver/xserver-xorg-lite.inc             |    1 +
>   3 files changed, 2 insertions(+), 2 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!


