Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <wade_farnsworth@mentor.com>) id 1SwwPo-0001ys-H0
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 16:30:16 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1SwwEV-0007Nn-SU from wade_farnsworth@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 07:18:35 -0700
Received: from SVR-ORW-FEM-03.mgc.mentorg.com ([147.34.97.39]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 2 Aug 2012 07:18:35 -0700
Received: from [172.30.4.61] (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.1.289.1; Thu, 2 Aug 2012
	07:18:34 -0700
Message-ID: <501A8C20.8020502@mentor.com>
Date: Thu, 2 Aug 2012 07:18:08 -0700
From: Wade Farnsworth <wade_farnsworth@mentor.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-OriginalArrivalTime: 02 Aug 2012 14:18:35.0705 (UTC)
	FILETIME=[B422C290:01CD70B9]
Subject: [PATCH 0/1] systemtap-uprobes: inhibit package strip
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
X-List-Received-Date: Thu, 02 Aug 2012 14:30:16 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

The following changes since commit 56d3bc38bc89b11e5a32908cad0cd6efa4fab08c:
  Wade Farnsworth (1):
        systemtap-uprobes: inhibit package strip

are available in the git repository at:

  https://github.com/wfarnsworth/oe-core.git stap-uprobes

Wade Farnsworth (1):
  systemtap-uprobes: inhibit package strip

 .../systemtap/systemtap-uprobes_git.bb             |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)



