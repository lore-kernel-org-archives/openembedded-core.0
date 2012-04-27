Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SNsl0-0000Kx-0o
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Apr 2012 23:31:14 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 27 Apr 2012 14:21:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="93985187"
Received: from unknown (HELO [10.255.12.123]) ([10.255.12.123])
	by AZSMGA002.ch.intel.com with ESMTP; 27 Apr 2012 14:21:34 -0700
Message-ID: <4F9B0DDE.7030507@linux.intel.com>
Date: Fri, 27 Apr 2012 14:21:34 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1334763599.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1334763599.git.dvhart@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: Re: [PATCH 0/1] gthumb: Disable parallel make for gthumb install
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
X-List-Received-Date: Fri, 27 Apr 2012 21:31:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/18/2012 08:40 AM, Darren Hart wrote:
> The following changes since commit 00256125873ff6f1630743a712e882e5f473a9d2:
>
>    self-hosted-image: Update poky revision to point at the 1.2 release branch (2012-04-18 15:59:20 +0100)
>
> are available in the git repository at:
>    git://git.yoctoproject.org/user-contrib/dvhart/oe-core gthumb
>    http://git.yoctoproject.org/cgit.cgi/user-contrib/dvhart/oe-core/log/?h=dvhart/gthumb
>
> Darren Hart (1):
>    gthumb: Disable parallel make for gthumb install
>
>   meta/recipes-gnome/gthumb/gthumb_2.12.4.bb |    2 ++
>   1 files changed, 2 insertions(+), 0 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!


