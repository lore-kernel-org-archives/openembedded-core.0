Return-Path: <radu.moisan@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 8579D6AF13
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jul 2013 11:52:15 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 05 Jul 2013 04:52:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1001,1363158000"; d="scan'208";a="365697488"
Received: from ubuntu.rb.intel.com (HELO [10.237.105.59]) ([10.237.105.59])
	by fmsmga002.fm.intel.com with ESMTP; 05 Jul 2013 04:52:15 -0700
Message-ID: <51D6B3E2.1040608@intel.com>
Date: Fri, 05 Jul 2013 14:54:10 +0300
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1372950678.git.radu.moisan@intel.com>
	<CAJTo0LaQGPWUCjJ5=Lnm5DAhdjsA9rSoM0tx2Dp141UKfq7WcA@mail.gmail.com>
	<51D5B68D.40809@linux.intel.com>
In-Reply-To: <51D5B68D.40809@linux.intel.com>
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
X-List-Received-Date: Fri, 05 Jul 2013 11:52:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


On 07/04/2013 08:53 PM, Saul Wold wrote:
> On 07/04/2013 09:11 AM, Burton, Ross wrote:
>> On 4 July 2013 16:13, Radu Moisan <radu.moisan@intel.com> wrote:
>>> * elfutils: license changed to GPLv3
>>
>> Humpf.  As elfutils disappearing in a no-GPLv3 build will have
>> effects, I expect we'll either want to a) hold back on this or b) have
>> both versions.
>>
> Typically we keep the older version for the non-GPLv3 builds.
>

So no issues with this patch, right?

Radu

