Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id 8BEFE7416A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 May 2015 12:31:56 +0000 (UTC)
Received: (qmail 14580 invoked by uid 1003); 14 May 2015 12:31:57 -0000
Received: from unknown (HELO ?192.168.11.121?)
	(philip@opensdr.com@108.44.122.151)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	14 May 2015 12:31:57 -0000
Message-ID: <555495BC.402@balister.org>
Date: Thu, 14 May 2015 08:31:56 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, 
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: meta-oe and oe-core mirror repos going away at the end of June
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
X-List-Received-Date: Thu, 14 May 2015 12:31:58 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

For several "years", we have maintained two copies of the
openembedded-core and meta-openembedded repositories on github. At OEDAM
we decided it is time to go ahead and remove the repos with the old
names oe-core and meta-oe to lower the confusion level about what is in
these repos.

Please update build scripts and git config files with the current names,
openemebdded-core and meta-openembedded.

Thanks,

Philip

