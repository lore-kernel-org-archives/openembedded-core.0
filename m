Return-Path: <rpjday@crashcourse.ca>
Received: from cpanel2.indieserve.net (cpanel2.indieserve.net [199.212.143.6])
	by mail.openembedded.org (Postfix) with ESMTP id D51496E650
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 May 2017 20:17:57 +0000 (UTC)
Received: from cpec03f0ed08c7f-cm68b6fcf980b0.cpe.net.cable.rogers.com
	([174.118.92.171]:50612 helo=localhost.localdomain)
	by cpanel2.indieserve.net with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.89)
	(envelope-from <rpjday@crashcourse.ca>) id 1d9dUE-0003O4-34
	for openembedded-core@lists.openembedded.org;
	Sat, 13 May 2017 16:17:58 -0400
Date: Sat, 13 May 2017 16:17:56 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1705131611020.9732@localhost.localdomain>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel2.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel2.indieserve.net: authenticated_id:
	rpjday+crashcourse.ca/only user confirmed/virtual account not
	confirmed
X-Authenticated-Sender: cpanel2.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: what is the current state of drones and drone S/W with OE?
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
X-List-Received-Date: Sat, 13 May 2017 20:17:58 -0000
Content-Type: text/plain; charset=US-ASCII


  i'm thinking of buying my first drone and, unsurprisingly, i'd like
to get something powered by a quad-core ARM and running something
built via OE, so what are the options out there?

  first, i note that there is a meta-uav layer:

https://github.com/koenkooi/meta-uav

but the last commit was 18 months ago, so i'm assuming that's not a
viable option.

  i also note the domain http://dronecode.org, which looks pretty
cool. and i also stumbled across what looks like the most promising
option -- the qualcomm-based snapdragon flight:

https://developer.qualcomm.com/hardware/snapdragon-flight

but that appears to not be a full drone, just the development kit, for
which you'd still have to purchase an actual drone to install it in.

  in any event, is there a canonical site that explains drones and OE?
any suggestions?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

