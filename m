Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RlSLM-0003sS-3Z
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jan 2012 22:37:56 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 11 Jan 2012 22:38:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="95017560"
Received: from unknown (HELO [10.255.13.168]) ([10.255.13.168])
	by azsmga001.ch.intel.com with ESMTP; 11 Jan 2012 22:38:25 -0800
Message-ID: <4F0E7FE1.8020409@linux.intel.com>
Date: Wed, 11 Jan 2012 22:38:25 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1326045849-21938-1-git-send-email-schnitzeltony@gmx.de>
In-Reply-To: <1326045849-21938-1-git-send-email-schnitzeltony@gmx.de>
Subject: Re: [PATCH 0/2] libusb1/libusb-compat keep *.la in base_libdir
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
X-List-Received-Date: Thu, 12 Jan 2012 21:37:56 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 01/08/2012 10:04 AM, Andreas Müller wrote:
> libusb-compat did not yet cause a build error but it is motivated by the
> experience with libusb1.
>
> I will be out until 12. and can not respond on comments until then.
>
> Andreas Müller (2):
>    libusb1: keep *.la in base_libdir
>    libusb-compat: keep *.la in base_libdir
>
>   meta/recipes-support/libusb/libusb-compat_0.1.3.bb |    3 +--
>   meta/recipes-support/libusb/libusb1_1.0.8.bb       |    3 +--
>   2 files changed, 2 insertions(+), 4 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!


