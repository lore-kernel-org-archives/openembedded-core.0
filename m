Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R6HZO-0005ko-TN
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Sep 2011 09:50:15 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 21 Sep 2011 00:44:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,415,1312182000"; d="scan'208";a="19108326"
Received: from unknown (HELO [10.255.14.170]) ([10.255.14.170])
	by AZSMGA002.ch.intel.com with ESMTP; 21 Sep 2011 00:44:52 -0700
Message-ID: <4E7995F4.5040409@linux.intel.com>
Date: Wed, 21 Sep 2011 00:44:52 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); en-US;
	rv:1.9.2.22) Gecko/20110902 Thunderbird/3.1.14
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1316562083.git.sgw@linux.intel.com>	<91e9da0fc938b836752d9e956e99931ec61464c0.1316562083.git.sgw@linux.intel.com>
	<3688FC08-2B0B-4230-BD32-4C57ED2B6BF1@dominion.thruhere.net>
In-Reply-To: <3688FC08-2B0B-4230-BD32-4C57ED2B6BF1@dominion.thruhere.net>
Subject: Re: [RC Fixes 7/8] distro tracking: Update Distro Aliases
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
X-List-Received-Date: Wed, 21 Sep 2011 07:50:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/21/2011 12:07 AM, Koen Kooi wrote:
>
> Op 21 sep. 2011, om 01:43 heeft Saul Wold het volgende geschreven:
>
>> Signed-off-by: Saul Wold<sgw@linux.intel.com>
>> ---
>> .../conf/distro/include/distro_tracking_fields.inc |   83 +++++++++++++++++++-
>> 1 files changed, 81 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
>>
>> DISTRO_PN_ALIAS_pn-task-core-qt = "OE-Core"
>> DISTRO_PN_ALIAS_pn-task-core-sdk = "OE-Core"
>> DISTRO_PN_ALIAS_pn-task-core-sdk-gmae = "OE-Core"
>> +DISTRO_PN_ALIAS_pn-task-core-ssh-dropbear = "Poky"
>> +DISTRO_PN_ALIAS_pn-task-core-ssh-openssh = "Poky"
>> DISTRO_PN_ALIAS_pn-task-core-standalone-gmae-sdk-target = "OE-Core"
>> DISTRO_PN_ALIAS_pn-task-core-standalone-sdk-target = "OE-Core"
>> DISTRO_PN_ALIAS_pn-task-core-tools = "OE-Core"
>> DISTRO_PN_ALIAS_pn-task-core-x11-sato = "OE-Core"
>> +DISTRO_PN_ALIAS_pn-task-qt4e = "Poky"
>> +DISTRO_PN_ALIAS_pn-task-qte-toolchain-host-natives = "Poky"
>> DISTRO_PN_ALIAS_pn-initramfs-boot = "OE-Core"
>> DISTRO_PN_ALIAS_pn-initramfs-live-boot = "OE-Core"
>> DISTRO_PN_ALIAS_pn-initramfs-live-install = "OE-Core"
>
>
> That doesn't look right

And your issue is?

They are part of OE-Core now correct?  Is this a problem?

Sau!

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


