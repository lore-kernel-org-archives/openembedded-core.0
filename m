Return-Path: <gary@mlbassoc.com>
X-Greylist: delayed 483 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 19 May 2015 15:23:46 UTC
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 8CD2D601DF
	for <openembedded-core@openembedded.org>;
	Tue, 19 May 2015 15:23:46 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 7AF30F811E3; Tue, 19 May 2015 09:15:44 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 1E630F811E3;
	Tue, 19 May 2015 09:15:44 -0600 (MDT)
Message-ID: <555B53AB.2010804@mlbassoc.com>
Date: Tue, 19 May 2015 09:15:55 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: "openembedded-core@openembedded.org" <openembedded-core@openembedded.org>
Subject: media player (gtk-play)
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
X-List-Received-Date: Tue, 19 May 2015 15:23:49 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Ross,

Do you know if there is a way to tell gtk-play what gstreamer
back-end(s) to use?  In particular, for my i.MX6 board, it is
not choosing the video plugin I think it should and it would be
nice to test if it does the right thing if the correct plugin
is used.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

