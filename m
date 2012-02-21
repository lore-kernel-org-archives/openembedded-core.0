Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1Rzysl-00053R-Qj
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Feb 2012 00:12:27 +0100
Received: by eekd41 with SMTP id d41so2438263eek.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2012 15:04:08 -0800 (PST)
Received-SPF: pass (google.com: domain of andrei@gherzan.ro designates
	10.14.53.9 as permitted sender) client-ip=10.14.53.9; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of andrei@gherzan.ro
	designates 10.14.53.9 as permitted sender)
	smtp.mail=andrei@gherzan.ro
Received: from mr.google.com ([10.14.53.9])
	by 10.14.53.9 with SMTP id f9mr13908560eec.64.1329865448596 (num_hops =
	1); Tue, 21 Feb 2012 15:04:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.14.53.9 with SMTP id f9mr11108263eec.64.1329865448429;
	Tue, 21 Feb 2012 15:04:08 -0800 (PST)
Received: from localhost.localdomain ([79.117.107.69])
	by mx.google.com with ESMTPS id o49sm95287997eeb.7.2012.02.21.15.04.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 21 Feb 2012 15:04:07 -0800 (PST)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Feb 2012 01:03:54 +0200
Message-Id: <1329865435-5734-1-git-send-email-andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.5.4
X-Gm-Message-State: ALoCoQla+k2UsGzHoRGJKTMdWHswHc5pq6bCYYJGTi+uuJmLCREV2Kg/QhYtMakf+9MEk20wcUMi
Subject: [Changes][PATCH v2 1/1] openssl: Move libcrypto to base_libdir
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
X-List-Received-Date: Tue, 21 Feb 2012 23:12:27 -0000


Remove .patch file. It was actually the whole git patch included.


