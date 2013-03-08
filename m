Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Florin.Sarbu@windriver.com>) id 1UDxVE-0006r1-7u
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Mar 2013 14:38:31 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r28DLroC015642
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Mar 2013 05:21:53 -0800 (PST)
Received: from [128.224.169.133] (128.224.169.133) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 8 Mar 2013 05:21:53 -0800
Message-ID: <5139E5F8.6040907@windriver.com>
Date: Fri, 8 Mar 2013 15:22:00 +0200
From: Florin Sarbu <florin.sarbu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130221 Thunderbird/17.0.3
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <5139DCA9.9020506@windriver.com>
In-Reply-To: <5139DCA9.9020506@windriver.com>
X-Forwarded-Message-Id: <5139DCA9.9020506@windriver.com>
Subject: systemd 197 not mirrored
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
X-List-Received-Date: Fri, 08 Mar 2013 13:38:36 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Had this email sent to poky@yoctoproject.org but maybe this mailing list 
is the better place to ask.

Seems there is an issue downloading systemd 197 from the SRC_URI defined 
in the recipe. On the other hand, the mirrors don't have version 197 of 
systemd, but rather only 196.
Anybody else getting that today?

Thank you.



