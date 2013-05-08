Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Ua7kf-0006nZ-H5
	for openembedded-core@lists.openembedded.org;
	Wed, 08 May 2013 19:02:02 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 08 May 2013 09:43:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,635,1363158000"; d="scan'208";a="334483657"
Received: from unknown (HELO [10.255.13.9]) ([10.255.13.9])
	by fmsmga002.fm.intel.com with ESMTP; 08 May 2013 09:43:17 -0700
Message-ID: <518A80A4.5050901@linux.intel.com>
Date: Wed, 08 May 2013 09:43:16 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Ionut Radu <ionutx.radu@intel.com>
References: <1368024119-4149-1-git-send-email-ionutx.radu@intel.com>
	<1368024119-4149-4-git-send-email-ionutx.radu@intel.com>
	<CAJTo0LbwTmE1Un=GFVWQok=38Ljzeg0PSJ5ZhqZRQ0b_efD3Vg@mail.gmail.com>
In-Reply-To: <CAJTo0LbwTmE1Un=GFVWQok=38Ljzeg0PSJ5ZhqZRQ0b_efD3Vg@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/9] js: updated from 1.7.0+1.8.0rc1 to 185-1.0.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 May 2013 17:02:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/08/2013 07:55 AM, Burton, Ross wrote:
> On 8 May 2013 15:41, Ionut Radu <ionutx.radu@intel.com> wrote:
>> Signed-off-by: Ionut Radu <ionutx.radu@intel.com>
>
> Is there anything in oe-core that still needs this?  I suspect we only
> had it for Web, but as we dropped the non-webkit Web a while back I
> don't think we're actually building this at all (apart from in world
> builds) so should we discuss moving it to meta-oe?
>
Agreed, we should move this recipe to meta-oe and remove it from oe-core 
at this time.

Sau!

> Ross
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


