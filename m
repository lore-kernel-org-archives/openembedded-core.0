Return-Path: <morphis@gravedo.de>
X-Greylist: delayed 498 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 01 Aug 2016 11:40:25 UTC
Received: from h1108419.serverkompetenz.net (gravedo.de [85.214.79.159])
	by mail.openembedded.org (Postfix) with ESMTP id 8E6796612C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Aug 2016 11:40:25 +0000 (UTC)
Received: from [192.168.178.186] (pD9ED69EC.dip0.t-ipconnect.de
	[217.237.105.236])
	by h1108419.serverkompetenz.net (Postfix) with ESMTPSA id 66314137C03D4;
	Mon,  1 Aug 2016 13:32:03 +0200 (CEST)
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, yocto@yoctoproject.org
From: Simon Fels <morphis@gravedo.de>
Message-ID: <7603e18c-345c-ddcf-cd95-14df64b60077@gravedo.de>
Date: Mon, 1 Aug 2016 13:32:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
Subject: Snaps on Yocto/OpenEmbedded
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
X-List-Received-Date: Mon, 01 Aug 2016 11:40:26 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hey everyone,

I've worked on a new layer recently which brings snaps to any
Yocto/OpenEmbedded based system.

If you have never heard about snaps yet you will find most details at
http://snapcraft.io/ but generally snaps are a new packaging format made
with security and fast updates in mind and allows applications to be
packaged once but run everywhere no matter of the distribution used or a
particular device type.

The layer is currently named meta-snappy and is available at
https://github.com/morphis/meta-snappy

It comes with some basic instructions how to get quickly started. A
basic tour through the snap system and how to use it is available at
http://snapcraft.io/

If you have any questions, bugs or contributions feel free to get in
contact with me.

regards,
Simon

