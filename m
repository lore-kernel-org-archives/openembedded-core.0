Return-Path: <rpjday@crashcourse.ca>
Received: from cpanel2.indieserve.net (cpanel2.indieserve.net [199.212.143.6])
	by mail.openembedded.org (Postfix) with ESMTP id 218F077C81
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Apr 2017 11:15:55 +0000 (UTC)
Received: from [::1] (port=50524 helo=cpanel2.indieserve.net)
	by cpanel2.indieserve.net with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.88)
	(envelope-from <rpjday@crashcourse.ca>) id 1cyGFf-00046f-VV
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Apr 2017 07:15:56 -0400
Received: from 158.116.144.29 ([158.116.144.29]) by crashcourse.ca (Horde
	Framework) with HTTPS; Wed, 12 Apr 2017 07:15:55 -0400
Date: Wed, 12 Apr 2017 07:15:55 -0400
Message-ID: <20170412071555.Horde.WkuL5T4dK5uOiFmA9pdI9jy@crashcourse.ca>
From: rpjday@crashcourse.ca
To: openembedded-core@lists.openembedded.org
User-Agent: Horde Application Framework 5
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel2.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel2.indieserve.net: authenticated_id:
	rpjday@crashcourse.ca
X-Authenticated-Sender: cpanel2.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: [OT] suggestions for OE-supported targets for playing with accelerometers?
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
X-List-Received-Date: Wed, 12 Apr 2017 11:16:05 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
Content-Disposition: inline


   i've just started a gig that involves (among other things) goofing  
around with
accelerometers, and was open to recommendations for OE-supported  
target boards that
are already accelerometer-ready or have layers out there with  
accelerometer recipes
ready to go so i can start playing.

   i've already found this from digi:

https://github.com/digidotcom/meta-digi/blob/dylan/meta-digi-dey/recipes-digi/dey-examples/dey-examples-accelerometer.bb

which is terrifically convenient since i have a digi board.

   i know *zero* about accelerometers, so this is all going to be from scratch.
any other suggestions for boards that would be good for experimenting that i
can get from places like digikey or mouser?  thanks.

rday


