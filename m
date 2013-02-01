Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1U1DUc-0003EU-3H
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Feb 2013 11:05:16 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 01 Feb 2013 01:49:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,579,1355126400"; d="scan'208";a="197624847"
Received: from dell-desktop (HELO [10.237.105.59]) ([10.237.105.59])
	by AZSMGA002.ch.intel.com with ESMTP; 01 Feb 2013 01:49:14 -0800
Message-ID: <510B8F99.1000403@intel.com>
Date: Fri, 01 Feb 2013 11:49:13 +0200
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1359710522-26839-1-git-send-email-radu.moisan@intel.com>
	<CALbNGRR7skJWjq+hkTKTTBoJswH0-wFULRkJVPr6h5-nhfS=WA@mail.gmail.com>
	<CAJTo0LahXzLg_4zcb7qfFi3A1S-aCJLVSKFDFVhpYPjLh9Zkgw@mail.gmail.com>
In-Reply-To: <CAJTo0LahXzLg_4zcb7qfFi3A1S-aCJLVSKFDFVhpYPjLh9Zkgw@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] polkit: Enable systemd support
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
X-List-Received-Date: Fri, 01 Feb 2013 10:05:18 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 02/01/2013 11:47 AM, Burton, Ross wrote:
> On 1 February 2013 09:39, Andreas Müller <schnitzeltony@googlemail.com> wrote:
>> On Fri, Feb 1, 2013 at 10:22 AM, Radu Moisan <radu.moisan@intel.com> wrote:
>>> enable/disable support as relevant
>>>
>>> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
>>> Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
>> What caused my sign-off - or is it a hint that meta-oe/meta-systemd
>> need alignment with this?
> This patch is the meta-oe appends merged into oe-core - so yes once
> this has been integrated the meta-oe and meta-systemd bbappends can be
> removed.
>
> Actually looking at the commit log, it appears that JaMa did the
> important commit so credit to him should be given.
Noted.


