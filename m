Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1U1LDu-0002yS-0o
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Feb 2013 19:20:27 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r11I4dQb022295
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 1 Feb 2013 10:04:39 -0800 (PST)
Received: from e6410-2 (172.25.40.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Fri, 1 Feb 2013 10:04:36 -0800
Date: Fri, 1 Feb 2013 12:04:33 -0600
From: Peter Seebach <peter.seebach@windriver.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20130201120433.75b9dfaa@e6410-2>
In-Reply-To: <20130201122244.GE3234@jama.dyndns-home.com>
References: <cover.1359669354.git.peter.seebach@windriver.com>
	<fd09dfbdf025e14bcccaedb85d9d3f16e6f4aa58.1359669354.git.peter.seebach@windriver.com>
	<20130201122244.GE3234@jama.dyndns-home.com>
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.10; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] pseudo.inc: Fix sqlite libdir again, pseudo 1.4.3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Feb 2013 18:20:29 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Fri, 1 Feb 2013 13:22:44 +0100
Martin Jansa <martin.jansa@gmail.com> wrote:

> You can remove PR when upgrading PV.

Thanks! I had been sort of wondering whether there was a way to get
away from ever-increasing PR, but I hadn't actually followed through to
find out.

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.


