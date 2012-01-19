Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RnyGg-00029I-Ll
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 21:07:30 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Jan 2012 11:59:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="98421571"
Received: from unknown (HELO [10.255.14.6]) ([10.255.14.6])
	by orsmga001.jf.intel.com with ESMTP; 19 Jan 2012 11:59:50 -0800
Message-ID: <4F187635.9020405@linux.intel.com>
Date: Thu, 19 Jan 2012 11:59:49 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1326933077-24099-1-git-send-email-josh@linux.intel.com>
In-Reply-To: <1326933077-24099-1-git-send-email-josh@linux.intel.com>
Subject: Re: [PATCH] distro-tracking-fields: claim responsibility for udev, dpkg, apt, v86d
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
X-List-Received-Date: Thu, 19 Jan 2012 20:07:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/18/2012 04:31 PM, Joshua Lock wrote:
> Nominate myself to be on the hook for updates to the udev, dpkg, apt and v86d
> recipes.
>
> Add a copy of the clutter-1.8 metadata without the namespace to keep the
> tools happy when they find the clutter_git recipe.
>
> Signed-off-by: Joshua Lock<josh@linux.intel.com>
> ---
>   .../conf/distro/include/distro_tracking_fields.inc |   38 +++++++++++--------
>   1 files changed, 22 insertions(+), 16 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!


