Return-Path: <philip@balister.org>
Received: from sanddollar.geekisp.com (sanddollar.geekisp.com
	[216.168.135.167])
	by mail.openembedded.org (Postfix) with SMTP id 9B92E605B3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Nov 2015 02:30:41 +0000 (UTC)
Received: (qmail 27916 invoked by uid 1003); 29 Nov 2015 02:30:40 -0000
Received: from unknown (HELO ?192.168.11.125?)
	(philip@opensdr.com@108.44.110.59)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	29 Nov 2015 02:30:40 -0000
To: openembedded-core <openembedded-core@lists.openembedded.org>
From: Philip Balister <philip@balister.org>
Message-ID: <565A634F.4020508@balister.org>
Date: Sat, 28 Nov 2015 21:30:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
Subject: Should the devmem2 recipe move to oe-core?
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
X-List-Received-Date: Sun, 29 Nov 2015 02:30:43 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

I was poking at the layer index and ran across this:

http://layers.openembedded.org/layerindex/branch/master/recipes/?q=devmem

The recipe appears in 4 layers.

Should we just move it to openembedded-core? I wonder how easy it would
be to have the layer index report duplicate recipes?

Philip

