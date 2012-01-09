Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rk7xB-00081V-DS
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jan 2012 06:39:29 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 08 Jan 2012 21:32:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="54555349"
Received: from unknown (HELO [10.255.13.28]) ([10.255.13.28])
	by AZSMGA002.ch.intel.com with ESMTP; 08 Jan 2012 21:32:01 -0800
Message-ID: <4F0A7BD1.3070000@linux.intel.com>
Date: Sun, 08 Jan 2012 21:32:01 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1325806595.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1325806595.git.andrea.adami@gmail.com>
Subject: Re: [PATCH 0/2] xserver minor cleanings and commit of fbdev driver
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
X-List-Received-Date: Mon, 09 Jan 2012 05:39:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/05/2012 03:42 PM, Andrea Adami wrote:
> Andrea Adami (2):
>    x11-common: remove extraneous BSP customizations
>    xorg-driver: add xf86-video-fbdev from meta-openembedded
>
>   .../x11-common/x11-common/etc/X11/Xserver          |   24 --------------------
>   .../xorg-driver/xf86-video-fbdev_0.4.2.bb          |    8 ++++++
>   2 files changed, 8 insertions(+), 24 deletions(-)
>   create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-fbdev_0.4.2.bb
>

Merged into OE-Core

Thanks
	Sau!


