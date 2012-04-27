Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SNsXY-0008Pg-US
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Apr 2012 23:17:21 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 27 Apr 2012 14:07:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="93981795"
Received: from unknown (HELO [10.255.12.123]) ([10.255.12.123])
	by AZSMGA002.ch.intel.com with ESMTP; 27 Apr 2012 14:07:41 -0700
Message-ID: <4F9B0A9C.7060104@linux.intel.com>
Date: Fri, 27 Apr 2012 14:07:40 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1333001415.git.Martin.Jansa@gmail.com>
	<cover.1333028738.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1333028738.git.Martin.Jansa@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCHv2 0/2] more kernel.bbclass updates
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
X-List-Received-Date: Fri, 27 Apr 2012 21:17:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/29/2012 07:08 AM, Martin Jansa wrote:
> The following changes since commit 432e36300d7231c9b01cd2c6c4b39b84cf4fddca:
>
>    rpm: Ensure we depend on file (2012-03-28 18:40:20 +0100)
>
> are available in the git repository at:
>    git://git.openembedded.org/openembedded-core-contrib jansa/kernel2
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/kernel2
>
> Martin Jansa (2):
>    kernel.bbclass: merge uboot_mkimage improvements from meta-oe
>    kernel.bbclass: unify white spaces
>
>   meta/classes/kernel.bbclass |   67 ++++++++++++++++++++++++------------------
>   1 files changed, 38 insertions(+), 29 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!


