Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id E67657201A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jan 2015 14:57:01 +0000 (UTC)
Received: (qmail 714 invoked by uid 1003); 6 Jan 2015 14:57:01 -0000
Received: from unknown (HELO ?192.168.1.124?) (philip@opensdr.com@108.44.89.75)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	6 Jan 2015 14:57:01 -0000
Message-ID: <54ABF7BC.1000404@balister.org>
Date: Tue, 06 Jan 2015 09:57:00 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Dizzy broken for building SD cards with wic
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
X-List-Received-Date: Tue, 06 Jan 2015 14:57:02 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

https://bugzilla.yoctoproject.org/show_bug.cgi?id=7114

This bug also impacts dizzy now. Do we have a way to back the offending
change out of dizzy while the bug is fixed?

It's partly my fault the report came a week or so after we noticed it in
master. Sorry for the delay getting it in the bug tracker.

Philip

