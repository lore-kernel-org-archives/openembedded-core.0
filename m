Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 19B426AF53
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2013 17:53:17 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 04 Jul 2013 10:50:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,996,1363158000"; d="scan'208";a="340569803"
Received: from unknown (HELO [10.255.13.183]) ([10.255.13.183])
	by orsmga001.jf.intel.com with ESMTP; 04 Jul 2013 10:53:17 -0700
Message-ID: <51D5B68D.40809@linux.intel.com>
Date: Thu, 04 Jul 2013 10:53:17 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1372950678.git.radu.moisan@intel.com>
	<CAJTo0LaQGPWUCjJ5=Lnm5DAhdjsA9rSoM0tx2Dp141UKfq7WcA@mail.gmail.com>
In-Reply-To: <CAJTo0LaQGPWUCjJ5=Lnm5DAhdjsA9rSoM0tx2Dp141UKfq7WcA@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 00/10] Package Upgrades
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
X-List-Received-Date: Thu, 04 Jul 2013 17:53:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/04/2013 09:11 AM, Burton, Ross wrote:
> On 4 July 2013 16:13, Radu Moisan <radu.moisan@intel.com> wrote:
>> * elfutils: license changed to GPLv3
>
> Humpf.  As elfutils disappearing in a no-GPLv3 build will have
> effects, I expect we'll either want to a) hold back on this or b) have
> both versions.
>
Typically we keep the older version for the non-GPLv3 builds.

Sau!

> Ross
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

