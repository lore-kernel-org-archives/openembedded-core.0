Return-Path: <pbarker@toganlabs.com>
X-Greylist: delayed 328 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 03 Apr 2017 10:32:05 UTC
Received: from nov-007-i592.relay.mailchannels.net
	(nov-007-i592.relay.mailchannels.net [46.232.183.146])
	by mail.openembedded.org (Postfix) with ESMTP id 16FA271ADD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Apr 2017 10:32:04 +0000 (UTC)
X-Sender-Id: hostpapa|x-authuser|pbarker@toganlabs.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 0600C204011;
	Mon,  3 Apr 2017 10:26:35 +0000 (UTC)
Received: from hp181.hostpapa.com (unknown [100.96.131.98])
	by relay.mailchannels.net (Postfix) with ESMTPA id 6E92620405E;
	Mon,  3 Apr 2017 10:26:34 +0000 (UTC)
X-Sender-Id: hostpapa|x-authuser|pbarker@toganlabs.com
Received: from hp181.hostpapa.com (hp181.hostpapa.com [172.20.55.158])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384)
	by 0.0.0.0:2500 (trex/5.7.37); Mon, 03 Apr 2017 10:26:34 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostpapa|x-authuser|pbarker@toganlabs.com
X-MailChannels-Auth-Id: hostpapa
X-Turn-Abortive: 100ccb731bce9015_1491215194836_1010275379
X-MC-Loop-Signature: 1491215194835:3414980479
X-MC-Ingress-Time: 1491215194834
Received: from cpc116908-shep14-2-0-cust920.8-3.cable.virginm.net
	([82.34.23.153]:2506 helo=host0.betafive.co.uk)
	by hp181.hostpapa.com with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.87)
	(envelope-from <pbarker@toganlabs.com>)
	id 1cuzBx-001sR8-CN; Mon, 03 Apr 2017 12:26:34 +0200
Date: Mon, 3 Apr 2017 11:26:30 +0100
From: Paul Barker <pbarker@toganlabs.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20170403112630.15727a7f@host0.betafive.co.uk>
In-Reply-To: <CAJTo0Lac+CqnXxzJoanw9iAQii_oeeKum1ebkFCT+3ExJVhAMQ@mail.gmail.com>
References: <20170402213135.21193-1-pbarker@toganlabs.com>
	<CAJTo0Lac+CqnXxzJoanw9iAQii_oeeKum1ebkFCT+3ExJVhAMQ@mail.gmail.com>
Organization: =?UTF-8?B?VG9nw6Fu?= Labs
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=4.0
X-AuthUser: pbarker@toganlabs.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ethtool: Switch to download mirror
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
X-List-Received-Date: Mon, 03 Apr 2017 10:32:07 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 3 Apr 2017 09:57:15 +0100
"Burton, Ross" <ross.burton@intel.com> wrote:

> On 2 April 2017 at 22:31, Paul Barker <pbarker@toganlabs.com> wrote:
> 
> > The md5sum & sha256sum for ethtool-4.8.tar.gz have changed upstream :(
> >  
> 
> Have you verified with upstream that they haven't been compromised?
> 
> Ross

I've sent an email to confirm. I'll report back when I get a reply.

Cheers,
Paul

